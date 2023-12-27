//
//  AdvertCard.swift
//  tab
//
//  Created by agatsuma on 19/12/23.
//

import SwiftUI

struct AdvertCard: View {
    var advert: Advertisement
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            AsyncImage(url: URL(string: "https://svalmaz-001-site1.htempurl.com/" + advert.mainImageUrl)) { image in
                // Этот блок будет выполнен, когда изображение загрузится
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                // Этот блок будет показан, пока изображение загружается
                ProgressView()
            }
           
            
            .scaledToFill()
            .frame(width: 185, height: 185)
            
            .clipped()
            
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            Text(String(String(advert.price) + " USD"))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(findCategoryTitle(by: advert.categoryId) ?? "")
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .font(.system(size: 14))
            Text(advert.title)
                .lineLimit(2)
            HStack{
                AsyncImage(url: URL(string: "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/get?userId=" + String(advert.userId))) { image in
                    // Этот блок будет выполнен, когда изображение загрузится
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    // Этот блок будет показан, пока изображение загружается
                    ProgressView()
                }
                
                    .frame(width: 30, height: 30)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: "bubble.left.fill")
                    .foregroundColor(.gray)
                    
            }
                
                
            
           
        }
        .frame(width: 185)

    }
}

/*#Preview {
    AdvertCard(advert: Advertisement(id: 1, userId: 1, title: "sd", description: "as", cityId: 5, categoryId: 5, price: 100, mainImageUrl: "api/advert/image/get?advId=60", images: [Images(id: 1, advertisementId: 1, imageUrl: "asd")]))
}
*/
