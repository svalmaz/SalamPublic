//
//  MainPageView.swift
//  tab
//
//  Created by agatsuma on 7/10/23.
//

import SwiftUI

struct MainPageView: View {
    @State var searchText = ""
    @StateObject var viewModel = AdvertisementsViewModel()
    @State private var showSheet = false
    @State private var mainReq = "https://svalmaz-001-site1.htempurl.com/api/Advert/filter?title=null&minprice=-1&maxprice=-1&page=-1&cityId=-1&categoryId=-1&minlatitude=-1&minlongitude=-1&maxlatitude=-1&maxlongitude=-1"
   
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
    var advert: [Advertisement] = AdvertData.data
    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass") // Значок поиска
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            
                            TextField("Я ищу...", text: $searchText)
                                .padding(8)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .cornerRadius(10) // Скругление углов текстового поля и иконки

                        Button(action: {
                            showSheet.toggle()
                        }) {
                            Text("Фильтр")
                                .bold() // Жирный текст
                                .padding(.horizontal)
                        }
                        .foregroundColor(.BG)
                        .cornerRadius(10)
                    }
                    .padding([.top, .horizontal]) // Отступ для всего HStack

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button(action: {
                                let req1 = getCategoryGroup(num1: 3, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "briefcase")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.green.opacity(0.2)) // Изменён на светло-зелёный фон
                                    .foregroundColor(.green) // Зелёный цвет иконки
                                    .clipShape(Circle()) // Форма кнопки круглая
                                    .overlay(
                                        Circle() // Круглая обводка
                                            .stroke(Color.green.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2) // Тень
                            }
                            .frame(width: 70, height: 70) // Изменён размер кнопки

                            Button(action: {
                                let req1 = getCategoryGroup(num1: 7, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {                                Image(systemName: "box.truck")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.blue.opacity(0.2)) // Светло-голубой фон
                                    .foregroundColor(.blue) // Синий цвет иконки
                                    .clipShape(Circle()) // Сделать форму круглой
                                    .overlay(
                                        Circle() // Использовать круглую обводку
                                            .stroke(Color.blue.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2) // Добавить тень
                            }
                            .frame(width: 70, height: 70) // Изменить размер кнопки

                            Button(action: {
                                let req1 = getCategoryGroup(num1: 1, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "house")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.purple.opacity(0.2)) // Светло-фиолетовый фон
                                    .foregroundColor(.purple) // Фиолетовый цвет иконки
                                    .clipShape(Circle()) // Форма кнопки круглая
                                    .overlay(
                                        Circle() // Круглая обводка
                                            .stroke(Color.purple.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2) // Тень
                            }
                            .frame(width: 70, height: 70) // Изменён размер кнопки
                            Button(action: {
                                let req1 = getCategoryGroup(num1: 2, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "hammer")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.orange.opacity(0.2)) // Светло-оранжевый фон
                                    .foregroundColor(.orange) // Оранжевый цвет иконки
                                    .clipShape(Circle()) // Форма кнопки круглая
                                    .overlay(
                                        Circle() // Круглая обводка
                                            .stroke(Color.orange.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2) // Тень
                            }
                            .frame(width: 70, height: 70) // Изменён размер кнопки
                            Button(action: {
                                let req1 = getCategoryGroup(num1: 8, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "message")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.cyan.opacity(0.2))
                                    .foregroundColor(.cyan)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.cyan.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
                            }
                            .frame(width: 70, height: 70)


                            Button(action: {
                                let req1 = getCategoryGroup(num1: 4, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "fork.knife")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.red.opacity(0.2))
                                    .foregroundColor(.red)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.red.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
                            }
                            .frame(width: 70, height: 70)

                            Button(action: {
                                let req1 = getCategoryGroup(num1: 5, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "dollarsign.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.yellow.opacity(0.2))
                                    .foregroundColor(.yellow)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.yellow.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
                            }
                            .frame(width: 70, height: 70)

                            Button(action: {
                                let req1 = getCategoryGroup(num1: 6, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "shippingbox") // Иконка для Передачи посылок
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.brown.opacity(0.2))
                                    .foregroundColor(.brown)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.brown.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
                            }
                            .frame(width: 70, height: 70)
                            Button(action: {
                                let req1 = getCategoryGroup(num1: 10, num2: 1)
                                viewModel.loadAdvertisements(req: req1)                            }) {
                                Image(systemName: "questionmark.circle") // Иконка для Разного
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.gray)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                    )
                                    .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
                            }
                            .frame(width: 70, height: 70)

                        }
                        .padding(.horizontal)
                    }.fullScreenCover(isPresented: $showSheet, content: {
                        FilterMainLast(req: $mainReq)
                    })
                }
                ScrollView{
                    
                    LazyVGrid(columns: columns, spacing: 10){
                        
                            ForEach(viewModel.advertisements) { product in
                                NavigationLink(destination: AdvertMainCard(advertisement: product)) {
                                    AdvertCard(advert: product).foregroundColor(.primary)
                                }
                            }
                        
                    }
                }.refreshable {
                    viewModel.loadAdvertisements(req: mainReq)
                }
                
            } .onChange(of: mainReq) { newValue in
                if newValue != " " {
                    print("Asd")
                    // Действие, выполняемое после возвращения с SecondView
                    viewModel.loadAdvertisements(req: mainReq)
                }
            }
            .onAppear {
               viewModel.loadAdvertisements(req: mainReq)
            }}
       
        
    }
        
}

#Preview {
    MainPageView()
}
