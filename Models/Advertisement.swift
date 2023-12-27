import SwiftUI
import Combine
struct Advertisement: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var description: String
    var cityId: Int
    var categoryId: Int
    var price: Int
    var mainImageUrl: String
    var images: [Images]
    var latitude: Double
    var longitude: Double
    
}
struct Advertisement1: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var description: String
    var cityId: Int
    var categoryId: Int
    var price: Double
    var mainImageUrl: String
    var images: [Images]
    var latitude: Double
    var longitude: Double
}

struct Images: Codable, Identifiable {
    var id: Int
    var advertisementId: Int
    var imageUrl: String
}
class AdvertisementsViewModel: ObservableObject {
    @Published var advertisements: [Advertisement] = []

    func loadAdvertisements(req: String) {
        guard let url = URL(string: req ) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            if let decodedResponse = try? JSONDecoder().decode([Advertisement].self, from: data) {
                DispatchQueue.main.async {
                    AdvertData.data = decodedResponse
                    self.advertisements = decodedResponse
                    for advert in decodedResponse {
                                          print("Добавлено объявление: \(advert.title)")
                                      }
                }
            }
        }.resume()
    }
}

struct AdvertData {
    static var data: [Advertisement] = []
}
func getCategoryGroup(num1: Int, num2: Int) -> String {
   return "https://svalmaz-001-site1.htempurl.com/api/Advert/filter/category?categoryGroup="+String(num1)+"&page="+String(num2)
    
}
