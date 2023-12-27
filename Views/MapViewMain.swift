import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
}

struct MapViewMain: View {
    @Binding var showMapView: Bool
    @Binding var longitude: Float

    @Binding var latitude: Float
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    @State private var searchQuery: String = ""

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
            Image(systemName: "mappin.circle.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            
            VStack {
              
                Spacer()
               
                Button("Сохранить местоположение") {
                    self.latitude = Float(self.region.center.latitude)
                    self.longitude = Float(self.region.center.longitude)
                 
                                       self.showMapView = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button(" Мое местоположение          ") {
                    if let currentLocation = locationManager.location?.coordinate {
                        region = MKCoordinateRegion(
                            center: currentLocation,
                            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                        )
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
    func search() {
           let searchRequest = MKLocalSearch.Request()
           searchRequest.naturalLanguageQuery = searchQuery

           let search = MKLocalSearch(request: searchRequest)
           search.start { response, error in
               guard let response = response else {
                   print("Error: \(error?.localizedDescription ?? "Unknown error").")
                   return
               }
               self.region = MKCoordinateRegion(center: response.boundingRegion.center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
           }
       }
}





