import SwiftUI

public struct profileData{
    let name: String
    let profileImage: String
    let profileId: Int
   // let profileAdvertidement: advertisementData
}
struct advertisementData{
    let id: Int
    let userId: Int
    let title: String
    let desc: String
    let cityId: Int
    let categoryId: Int
    let price: Float
    let mainImageUrl: String
}

struct AddAdvertModel: Codable {
    var userId: Int
    var title: String
    var description: String
    var cityId: Int
    var categoryId: Int
    var price: Int!
    var mainImage: String
    var images: [Image]
    var longitude: Float
    var latitude: Float

    struct Image: Codable {
        var image: String
    }
}
