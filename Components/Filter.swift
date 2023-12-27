//
//  Filter.swift
//  tab
//
//  Created by agatsuma on 18/12/23.
//
import SwiftUI

struct Filter: View {
    @State private var searchText = ""
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Я ищу...", text: $searchText)
                    .padding(8)
                   
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Text("Фильтр")
                        .padding(.horizontal)
                }
                
                .foregroundColor(.BG)
                .cornerRadius(10)
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "briefcase")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                            )
                    }).frame(width: 70, height: 40)
                    Button(action: {}, label: {
                        Image(systemName: "box.truck")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                            )
                    }).frame(width: 70, height: 10)
                    Button(action: {}, label: {
                        Image(systemName: "house")
                           
                        
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                            )
                    }).frame(width: 70, height: 20)
                    Button(action: { }, label: {
                        Image(systemName: "hammer")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.primary)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.primary.opacity(0.5), lineWidth: 1)                            )
                    }).frame(width: 70, height: 20)
                }
                .padding()
            }.fullScreenCover(isPresented: $showSheet, content: {
                FilterMainView()
            })
        }
    }
}

enum Category: String, CaseIterable {
    case work = "Работа"
    case longDistance = "Дальнобой"
    case housing = "Жильё"
    case services = "Услуги"
   
    
    var imageName: String {
        switch self {
        case .work:
            return "briefcase"
        case .longDistance:
            return "box.truck"
        case .housing:
            return "house"
        case .services:
            return "hammer"
       
        }
    }
}

struct CategoryView: View {
    let category: Category
    
    var body: some View {
        VStack {
            
            Image(systemName: category.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
           
        }
        .frame(width: 80, height: 50)
    }
}



#Preview {
    Filter()
}
