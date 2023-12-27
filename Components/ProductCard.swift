//
//  ProductCard.swift
//  tab
//
//  Created by agatsuma on 9/10/23.
//

import SwiftUI

struct ProductCard: View {
    var product:Product
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5){
            
            Image(uiImage: product.imageMain)
                    .resizable()
                   
                    .scaledToFill()
                    .frame(width: 185, height: 185)
                               
                    .clipped()
            
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            Text(product.priceMain)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(product.categoryMain)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .font(.system(size: 14))
            Text(product.titleMain)
                .lineLimit(2)
            HStack{
                Image(uiImage: product.authorImageMain)
                    .resizable()
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

#Preview {
    ProductCard(product: ProductList.data[0])
}
