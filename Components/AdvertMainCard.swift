//
//  AdvertMainCard.swift
//  tab
//
//  Created by agatsuma on 20/12/23.
//

import SwiftUI
import _MapKit_SwiftUI

struct AdvertMainCard: View {
    let advertisement: Advertisement

    @State private var location: Location

       init(advertisement: Advertisement) {
           self.advertisement = advertisement
           let initialCoordinates = CLLocationCoordinate2D(latitude: advertisement.latitude, longitude: advertisement.longitude)
           self._region = State(initialValue: MKCoordinateRegion(
               center: initialCoordinates,
               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
           ))
           self._location = State(initialValue: Location(coordinates: initialCoordinates))
       }
  
    @State private var isShowingFullScreenImageViewer = false

    @State private var selectedImageIndex = 0
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
                // Images TabView
                TabView(selection: $selectedImageIndex) {
                    ForEach(Array(advertisement.images.enumerated()), id: \.element.id) { index, img in
                        AsyncImage(url: URL(string: "https://svalmaz-001-site1.htempurl.com/" + img.imageUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture {
                                    self.selectedImageIndex = index
                                    self.isShowingFullScreenImageViewer.toggle()
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 300)
                        .cornerRadius(10)
                        .tag(index)
                    }
                }
                .background(Color.init(uiColor: .systemGray6))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 300)
                
                // Description
                VStack(alignment: .leading, spacing: 10) {
                    // Image viewer setup remains the same...
                    
                    // Price
                    Text("\(advertisement.price) " + " USD")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    // Description
                    Text(advertisement.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Text("Категория: \(findCategoryTitle(by: advertisement.categoryId) ?? "")")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text(advertisement.description)
                                   .font(.title3)
                                   .foregroundColor(.primary)
                    // Buttons
                    HStack {
                        Button(action: {
                            // Implement call action
                        }) {
                            Text("Позвонить")
                                .foregroundColor(.white)
                                       .frame(maxWidth: .infinity)
                                       .padding()
                                       .background(Color.blue)
                                       .cornerRadius(10)
                        }
                        
                        
                        Button(action: {
                            // Implement message action
                        }) {
                            Text("Написать")
                                .foregroundColor(.white)
                                       .frame(maxWidth: .infinity)
                                       .padding()
                                       .background(Color.green)
                                       .cornerRadius(10)
                        }
                    }
                    .padding(.vertical)
                    
                    // Category
                   
                    
                    // Map view
                    Text("Город: \(getCityName(fromCityId: advertisement.cityId) ?? "")")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Map(coordinateRegion: $region,
                                   annotationItems: [location]) { location in
                                  MapPin(coordinate: location.coordinates, tint: .red)
                              }
                              .frame(height: 150)
                              .cornerRadius(10)
                              .onAppear {
                                  setRegion(advertisement.latitude, advertisement.longitude)
                              }
                }  .sheet(isPresented: $isShowingFullScreenImageViewer) {
                    FullScreenImageViewer(images: advertisement.images, selectedImageIndex: $selectedImageIndex)
                }
                .cornerRadius(10)
               
                .padding([.top, .horizontal])
                Spacer()
            }
        }
       
        
    }
    
    struct AdvertisementView_Previews: PreviewProvider {
        static var previews: some View {
            AdvertMainCard(advertisement: Advertisement(
                
                id: 1,
                userId: 1,
                title: "Laptop for Sale",
                description: "Great condition laptop for everyday tasks. With SSD for quick performance.Great condition laptop for everyday tasks. With SSD for quick performance.Great condition laptop for everyday tasks. With SSD for quick performance.Great condition laptop for everyday tasks. With SSD for quick performance.Great condition laptop for everyday tasks. With SSD for quick performance.",
                cityId: 123,
                categoryId: 15,
                price: 42900,
                mainImageUrl: "https://example.com/main-image.jpg",
                images: [
                    Images(id: 1, advertisementId: 1, imageUrl: "https://svalmaz-001-site1.htempurl.com/api/advert/image/list/get?advId=60&index=0"),
                    Images(id: 2, advertisementId: 1, imageUrl: "https://svalmaz-001-site1.htempurl.com/api/advert/image/list/get?advId=59&index=0"),
                    Images(id: 3, advertisementId: 1, imageUrl: "https://svalmaz-001-site1.htempurl.com/api/advert/image/list/get?advId=57&index=0")
                ],
                latitude: 40.7128,
                longitude: -74.0060
                
                
            ))
            Spacer()
        }
        
    }
    private func setRegion(_ latitude: Double, _ longitude: Double) {
           let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
           region = MKCoordinateRegion(
               center: coordinates,
               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
           )
           location = Location(coordinates: coordinates)
       }
    struct FullScreenImageViewer: View {
        let images: [Images]
        @Binding var selectedImageIndex: Int
        
        var body: some View {
            TabView(selection: $selectedImageIndex) {
                ForEach(Array(images.enumerated()), id: \.element.id) { index, img in
                    AsyncImage(url: URL(string: "https://svalmaz-001-site1.htempurl.com/" + img.imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .onTapGesture {
                                // This would dismiss the full-screen viewer
                            }
                    } placeholder: {
                        Color.black.opacity(0.8)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .background(Color.black.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                // This allows the user to tap anywhere to dismiss the full-screen viewer
                withAnimation {
                    selectedImageIndex = 0 // Reset the index if needed or maintain it
                }
            }
        }
    }
    struct Location: Identifiable {
        let id = UUID()
        var coordinates: CLLocationCoordinate2D
    }
    
    #Preview {
        AdvertisementView_Previews() as! any View
    }
}



