import Foundation
import SwiftUI
extension View{
    func addAsyncAdvert(req: String) async throws -> String{
        let url = URL(string: "https://svalmaz-001-site1.htempurl.com/api/Advert/add")!

        var request = URLRequest(url: url)
        print(req)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("s")
        request.httpBody = req.data(using: .utf8)
        let(data, response) = try await URLSession.shared.data(for: request)
        let fetchedData = try String(decoding: data, as: UTF8.self)
        print(fetchedData)
        return fetchedData
        
    }
    func addAdvert(AddAdvertModel: String) {
        print("a")
        changeUserId(a:-1)
        let url = URL(string: "https://svalmaz-001-site1.htempurl.com/api/Advert/add")!
        let body = AddAdvertModel
        print("b")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body.data(using: .utf8)
        print("c")
        let task =  URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do{
                
                let str = String(decoding: data, as: UTF8.self)
                let a = str.split(separator: "\"")
                print(a)
                if(a[3] == "failed"){
                    changeUserId(a: 0)
                    print("failed")
                }
                else{
                    changeUserId(a: 1)
                }
            }
            
            
        }
        task.resume()
        var gg = getId()
        while(gg == -1){
            gg = getId()
            if(gg == 0) {
               
                
            }
            else if(gg != 0 && gg != -1){
              //  return ( "true")
            }
        }
      //  return("false1")
    }
   
    func getCityId(cityName: String) -> Int? {
        let cityIdMapping: [String: Int] = [
            "Нью-Йорк": 1,
            "Лос-Анджелес": 2,
            "Чикаго": 3,
            "Хьюстон": 4,
            "Финикс": 5,
            "Филадельфия": 6,
            "Сан-Антонио": 7,
            "Сан-Диего": 8,
            "Даллас": 9,
            "Сан-Хосе": 10,
            "Остин": 11,
            "Джэксонвилл": 12,
            "Форт-Уэрт": 13,
            "Колумбус": 14,
            "Индианаполис": 15,
            "Выбрать": -1

            // продолжайте добавление городов по мере необходимости
        ]

        return cityIdMapping[cityName]
    }
    func getCityName(fromCityId cityId: Int) -> String? {
        let cityIdMapping: [String: Int] = [
            "Нью-Йорк": 1,
            "Лос-Анджелес": 2,
            "Чикаго": 3,
            "Хьюстон": 4,
            "Финикс": 5,
            "Филадельфия": 6,
            "Сан-Антонио": 7,
            "Сан-Диего": 8,
            "Даллас": 9,
            "Сан-Хосе": 10,
            "Остин": 11,
            "Джэксонвилл": 12,
            "Форт-Уэрт": 13,
            "Колумбус": 14,
            "Индианаполис": 15,
            "Выбрать": -1
        ]

        // Переворачиваем словарь: ID городов становятся ключами, а названия городов - значениями
        let idCityMapping = Dictionary(uniqueKeysWithValues: cityIdMapping.map { ($1, $0) })

        return idCityMapping[cityId]
    }

    func getCategoryId(categoryName: String) -> Int? {
        let categoryIdMapping: [String: Int] = [
            "Покупка недвижимости": 1,
            "Покупка авто": 2,
            "Аренда недвижимости": 3,
            "Аренда авто": 4,
            "Технгика и электроника": 5,
            "Находки/отдам даром": 6,
            "Услуги": 7,
            "Прочее": 8,
            // продолжайте добавление категорий по мере необходимости
        ]

        return categoryIdMapping[categoryName]
    }
    func convertImagesToStrings(_ images: [UIImage]) -> [String] {
        
        
        return images.map { image in
            if let imageData = image.jpegData(compressionQuality: 0.5) {
                let base64String = imageData.base64EncodedString()
                return base64String
            }
            return ""
        }

    }

}
