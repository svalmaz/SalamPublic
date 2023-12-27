//
//  NewProductView.swift
//  tab
//
//  Created by agatsuma on 7/10/23.
//

import SwiftUI
import SimpleToast

import PhotosUI
import CoreTransferable
struct NewProductView: View {
    @State private var pickerSelection: String = "Выбрать"
    let jobOptions = [
        "Вакансии в кафе и ресторанах",
        "Вакансии в IT сфере",
        "Работа на пикап траках и траках",
        "Вакансии в салонах красоты",
        "Другие вакансии"
    ]
    @State private var jobSearchTerm: String = ""
    var filteredJobs: [String] {
        jobOptions.filter {
            jobSearchTerm.isEmpty ? true : $0.lowercased().contains(jobSearchTerm.lowercased())
        }
    }
    let serviceOptions = [
        "Услуги салонов красоты",
        "Бизнес-услуги (консультации и т.д.)",
        "Здоровье",
        "Переводы документов",
        "Юридические услуги и услуги адвокатов",
        "Образование и курсы",
        "Байерские услуги",
        "Другие услуги"
      
    ]
    @State private var showCities = false

    @State private var serviceSearchTerm: String = ""
    var filteredServices: [String] {
        serviceOptions.filter {
            serviceSearchTerm.isEmpty ? true : $0.lowercased().contains(serviceSearchTerm.lowercased())
        }
    }
    let cuisineOptions = [
        "Продажа готовых домашних блюд",
        "Рестораны, кафе"
    ]
   
    @State private var cuisineSearchTerm: String = ""
    var filteredCuisine: [String] {
        cuisineOptions.filter {
            cuisineSearchTerm.isEmpty ? true : $0.lowercased().contains(cuisineSearchTerm.lowercased())
        }
    }
    let moneyTransferOptions = [
        "Переводы денег Бишкек",
        "Переводы в Ош",
        "Переводы в Джалал-Абад",
        "Переводы в другие регионы КР",
        "Переводы в РФ",
        "Переводы в КЗ",
        "Переводы в другие страны"
    ]
    @State private var moneyTransferSearchTerm: String = ""
    var filteredMoneyTransfers: [String] {
        moneyTransferOptions.filter {
            moneyTransferSearchTerm.isEmpty ? true : $0.lowercased().contains(moneyTransferSearchTerm.lowercased())
        }
    }
    let parcelTransferOptions = [
        "Услуги доставки",
        "Передача"
    ]
    @State private var parcelTransferSearchTerm: String = ""
    var filteredParcelTransfers: [String] {
        parcelTransferOptions.filter {
            parcelTransferSearchTerm.isEmpty ? true : $0.lowercased().contains(parcelTransferSearchTerm.lowercased())
        }
    }
    @StateObject private var locationManager = LocationManager()
    let transportOptions = [
        "Продажа/покупка автомобилей",
        "Продажа/покупка траков и пикап траков",
        "Аренда автомобилей",
        "Услуги для DMV и SDL"
    ]
    @State private var distance: Double = 5

    @State private var transportSearchTerm: String = ""
    var filteredTransport: [String] {
        transportOptions.filter {
            transportSearchTerm.isEmpty ? true : $0.lowercased().contains(transportSearchTerm.lowercased())
        }
    }
    let communicationOptions = [
        "Форум для общения и обмена советами",
        "Социальное взаимодействие"
    ]
    @State private var communicationSearchTerm: String = ""
    var filteredCommunications: [String] {
        communicationOptions.filter {
            communicationSearchTerm.isEmpty ? true : $0.lowercased().contains(communicationSearchTerm.lowercased())
        }
    }

    let realEstateOptions = [
        "Аренда квартир",
        "Аренда комнат",
        "Покупка/продажа недвижимости",
        "Продажа/покупка домашние вещи"
        ]
        @State private var realEstateSearchTerm: String = ""

        var filteredRealEstate: [String] {
            realEstateOptions.filter {
                realEstateSearchTerm.isEmpty ? true : $0.lowercased().contains(realEstateSearchTerm.lowercased())
            }
        }
    /*
    let jobs = [
           "Продавцы и кассиры",
           "Авторемонт и сервис",
           "Водители | Экспедиторы",
           "Мувинг",
           "Строительство | Архитектура | Ремонт",
           "Няни | Уборка | Домработницы",
           "Парикмахерская | Салоны красоты | SPA",
           "Офисная работа",
           "IT специалисты",
           "Диспетчеры",
           "Медицина и Аптеки",
           "Рестораны и гостиницы",
           "Кабельщики | Технические специальности",
           "Образование | Спорт",
           "Фабрики и заводы",
           "Сиделки | Home attendants",
           "Удаленная работа",
           "Агентства по трудоустройству",
           "Временная | Для студентов | Сезонная",
           "Менеджеры по продажам | Salespersons",
           "Другие специальности"
       ]

       @State private var jobSearchTerm: String = ""
       
       var filteredJobs: [String] {
           jobs.filter {
               jobSearchTerm.isEmpty ? true : $0.lowercased().contains(jobSearchTerm.lowercased())
           }
       }
    let house = [
            "Место в комнате",
            "Комната",
            "4 Bdr",
            "3 Bdr",
            "2 Bdr",
            "1 Bdr",
            "Студия",
            "Дом",
            "Коммерческая недвижимость",
            "Апартаменты"
        ]
    @State private var houseSearchTerm: String = ""
    
    var filteredHouses: [String] {
        house.filter {
            houseSearchTerm.isEmpty ? true : $0.lowercased().contains(houseSearchTerm.lowercased())
        }
    }
    
    let services = [
        "Магазины",
                "Медицина",
                "Автоуслуги",
                "Дом и ремонт",
                "Юридические услуги",
                "Бухгалтерские услуги",
                "Красота и здоровье",
                "Риэлторы",
                "Медиа | СМИ",
                "IT | Компьютерные услуги",
                "Клининговые услуги",
                "Кредиты и ипотека",
                "Покупка и продажа бизнеса",
                "Уход за пожилыми",
                "Для детей",
                "Организация мероприятий",
                "Траковый бизнес",
                "Образование и курсы",
                "Отдых и досуг",
                "Страхование",
                "Прочее"
        ]
   

    
    @State private var serviceSearchTerm: String = ""
    
    var filteredServices: [String] {
        services.filter {
            serviceSearchTerm.isEmpty ? true : $0.lowercased().contains(serviceSearchTerm.lowercased())
        }
    }
    let cars = [
        "Dry Van",
              "Reefer",
              "Amazon (Drops&Hook)",
              "Flatbed",
              "Stepdeck",
              "Lowboy",
              "Автовозы",
              "Автовозы и закрытые"]
    @State private var carSearchTerm: String = ""
    
    var filteredCars: [String] {
        cars.filter {
            carSearchTerm.isEmpty ? true : $0.lowercased().contains(carSearchTerm.lowercased())
        }
    }
     */
    @State private var coordinatesText: String = ""
      @State private var showMapView = false
    
    @State var showToast = true
    private let toastOption = SimpleToastOptions(alignment: .top, hideAfter: 2, backdropColor: Color.gray, animation: .default, modifierType: .slide)
    
    @State var image: UIImage?
    @State var openGallery = false
    @State private var isLoading = false

    @State var images: [UIImage] = []
    @State var selectedItems: [PhotosPickerItem] = []
    @State var isOpen = false
    
    @State var imagesMain: [UIImage] = []
    @State var selectedItemsMain: [PhotosPickerItem] = []
 
    let rows = [
           GridItem(.fixed(50)),
           GridItem(.fixed(50))
       ]
    
    var columns = [GridItem(.adaptive(minimum: 55), spacing: 10)]
    @State private var selectedTheme = "Недвижимость"
    let themes = ["Dark", "Light", "Automatic"]
  
    
    @State private var selectedCity = "Нью-Йорк"
    let cities = ["Нью-Йорк", "Лос-Анджелес", "Чикаго","Хьюстон","Финикс","Филадельфия","Сан-Антонио","Сан-Диего","Даллас","Сан-Хосе","Остин","Джэксонвилл","Форт-Уэрт","Колумбус","Индианаполис"]
    
      @State private var searchCity: String = ""
    @State private var searchCityTerm: String = ""

    var filteredCity: [String] {
        cities.filter {
            searchCityTerm.isEmpty ? true : $0.lowercased().contains(searchCity.lowercased())
           }
       }
    let anotherOptions = [
            "Разное"
           
        ]
        @State private var anotherSearchTerm: String = ""

        var filteredAnother: [String] {
            anotherOptions.filter {
                anotherSearchTerm.isEmpty ? true : $0.lowercased().contains(anotherSearchTerm.lowercased())
            }
        }
   
    @Environment(\.presentationMode) var presentetionMode
    @State private var showCategories = false
    @State private var longitude: Float = 0
    @State private var latitude: Float = 0
    @State private var title = ""
    @State private var desc = ""
    @State private var category = ""
    @State private var price = ""
    @State private var city = ""
    @State var showDetail: Bool = false
    @State private var animationAmount = 1.0
    func loadData() async {
        isLoading = true
    }
    var body: some View {
        
        ZStack{
           
            if(isLoading == true){
                
            
                ProgressView("Подождите...")
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .frame(width: 150, height: 150)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(20)
                        
            }
            if (isLoading == false){
                
           
        NavigationView{
            
            
            ZStack {
                
                ScrollView{
                    
                    
                    VStack(){
                        HStack(){
                            Button(action:{
                                isOpen = true
                             
                              }){
                                Image(systemName: "xmark")
                                    .resizable()
                                
                                    .frame(width: 25, height: 25)
                                
                                
                                }.padding()
                                .alert("Вы уверены что хотите выйти?", isPresented: $isOpen) {
                                Button("Нет", role: .cancel) { 
                                    print(longitude)
                                    print(latitude)
                                }
                                Button("Да", action: {
                                 

                                    presentetionMode.wrappedValue.dismiss()

                                })
                               
                            }
                            
                            Spacer()
                            Text("Объявление")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.primary)
                            
                            Spacer()
                            Button(action:{
                                
                               print("Start")
                               
                                if(title=="" || price == "" || image == nil || images.count <= 0 || desc == ""){
                                showToast = true
                            }
                                else{
                                   isLoading = true
                                    let myData = LocalStorageModel.myValue
                                    let priceMain = Int(price)
                                    let a = convertImageToBase64String(img: image ?? UIImage(resource: .secondVideo))
                                   
                                    let asd = convertImagesToStrings(images)
                                   
                                   print(getCategoryId1(title: pickerSelection))
                                    var myModel = AddAdvertModel(userId: myData, title: title, description: desc, cityId: getCityId(cityName: selectedCity) ?? 1, categoryId: getCategoryId1(title: pickerSelection) ?? 1, price: priceMain, mainImage: a, images:[], longitude: longitude, latitude: latitude
                                                    
                                                    )
                                    for base64String in asd {
                                        let image1 = AddAdvertModel.Image(image: base64String)
                                        myModel.images.append(image1)
                                    }
                                    print("as1")
                                  
                                    Task{
                                        do {
                                            let jsonEncoder = JSONEncoder()
                                            jsonEncoder.outputFormatting = .prettyPrinted
                                        let jsonData = try        jsonEncoder.encode(myModel)
print("end")
                                            if let jsonString = String(data: jsonData, encoding: .utf8) {
                                              let b =  try await addAsyncAdvert(req: jsonString)
                                                isLoading = false
                                                presentetionMode.wrappedValue.dismiss()

                                            }
                                        } catch {
                                            print(error)
                                        }
                                        
                                        
                                    }
                                    
                                    print("as3")
                                  
                                     //  let a1 = addAdvert(model: myModel)
                                    //print(a1)
                                }
                                
                            }){
                                Text("Добавить")
                            }.padding(10)
                            
                        }
                        
                        HStack{
                            
                            Button {
                                openGallery.toggle()
                            } label: {
                                if let image = self.image{
                                    Image(uiImage: image) .resizable()
                                        .scaledToFill()
                                    
                                    
                                        .frame(width: 120, height: 120)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                else{
                                    Grid{
                                        Image(systemName: "camera.shutter.button.fill").frame(width: 55, height: 55)
                                        
                                        
                                            .frame(width: 55, height: 55)
                                            .foregroundStyle(.gray)
                                            .background(Color(uiColor: .systemGray5))
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }.frame(width: 120, height: 120)
                                        .foregroundStyle(.gray)
                                        .background(Color(uiColor: .systemGray5))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                }
                            }
                            
                            Spacer()
                            ScrollView(.horizontal){
                                
                                
                                LazyHGrid(rows: rows, alignment: .center){
                                    PhotosPicker(selection: $selectedItems,
                                                 maxSelectionCount: 8, matching: .images) {
                                        Image(systemName: "camera.shutter.button.fill").frame(width: 55, height: 55)
                                    }
                                                 .onChange(of: selectedItems) { selectedItems in
                                                     images = []
                                                     for item in selectedItems {
                                                         item.loadTransferable(type: Data.self) { result in
                                                             switch result {
                                                             case .success(let imageData):
                                                                 if let imageData {
                                                                     self.images.append(UIImage(data: imageData)!)
                                                                 } else {
                                                                     print("No supported content type found.")
                                                                 }
                                                             case .failure(let error):
                                                                 print(error)
                                                             }
                                                         }
                                                     }
                                                 }.frame(width: 55, height: 55)
                                        .foregroundStyle(.gray)
                                        .background(Color(uiColor: .systemGray5))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    ForEach(images, id:\.cgImage){ image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                        
                                        
                                            .frame(width: 55, height: 55)
                                            .clipped()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                    }.frame(width:.infinity)}.frame(width:.infinity) }
                        }
                        VStack(alignment: .leading, spacing: 5 ){
                            Text("Заголовок").padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))
                            TextField("Текст...", text: $title)
                            
                            
                                .padding(20)
                            
                            
                                .background(.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding()
                            Text("Описание").padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))
                            VStack{
                                
                                
                                TextEditor( text: $desc)
                                
                                
                                
                                //.textFieldStyle(.roundedBorder)
                                    .lineLimit(10)
                                    .frame(height: 100)
                                
                                    .lineLimit(15)
                                
                                
                                
                                
                                    .padding()
                                
                            }.overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding()
                            HStack{
                                Text("Цена").padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))
                                TextField("0", text: $price)
                                
                                
                                    .padding(20)
                                
                                
                                    .background(.gray.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding()
                            }
                            
                            Button(action: {
                                
                                showCategories.toggle()
                            }) {
                                HStack{
                                    Text("Категория")      .foregroundStyle(Color.BG)
                                        .font(.title3)
                                    Spacer()
                                    Text(pickerSelection)
                                    
                                        .foregroundStyle(.secondary)
                                    
                                } .frame(height:60)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.secondary))
                                    .padding(10)
                                
                            }.foregroundStyle(.primary)
                            
                            
                            
                                .pickerStyle(.navigationLink)
                            
                            
                            
                            
                            
                            
                            
                            Picker( selection: $selectedCity, label: Text("Город").font(.title3)) {
                                
                                SearchBar(text: $searchCityTerm, placeholder: "Search Countries")
                                ForEach(filteredCity, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height:60)
                            
                            .accentColor(Color.BG)
                            
                            .pickerStyle(.navigationLink)
                            
                            
                            .padding(10)
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary))
                            .padding(10)
                            HStack{
                                Button("Добавить координаты") {
                                    showMapView = true
                                }
                                .sheet(isPresented: $showMapView) {
                                    MapViewMain(showMapView: $showMapView, longitude: $longitude,  latitude: $latitude)
                                    
                                    
                                }
                                Spacer()
                              } .frame(height:60)
                            
                                .accentColor(Color.BG)
                                
                                .pickerStyle(.navigationLink)
                                
                                
                                .padding(10)
                                
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.secondary))
                                .padding(10)
                        }
                           
                    }
                    
                }
                
                
            }.sheet(isPresented: $showCategories, content:{
                NavigationView{
                    ScrollView{
                        VStack{
                            
                            Text("Категории").padding(40)
                                .bold()
                                .foregroundStyle(.primary)
                            Picker( selection: $pickerSelection, label: Text("Работа")) {
                                                        Text("")
                                                        SearchBar(text: $jobSearchTerm, placeholder: "Поиск работы")
                                                        ForEach(filteredJobs, id: \.self) {
                                                            Text($0)
                                                        }
                                                    }.frame(height:60)
                                                    
                                                        .accentColor(Color.primary)
                                                    
                                                        .pickerStyle(.navigationLink)
                                                    
                                                    
                                                        .padding(10)
                                                    
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 12)
                                                                .stroke(Color.secondary))
                                                        .padding(10)
                            
                            
                            Picker(selection: $pickerSelection, label: Text("Жильё и Недвижимость")) {
                                Text("")
                                SearchBar(text: $realEstateSearchTerm, placeholder: "Поиск недвижимости")
                                ForEach(filteredRealEstate, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            
                            Picker(selection: $pickerSelection, label: Text("Услуги и Бизнес")) {
                                Text("")
                                SearchBar(text: $serviceSearchTerm, placeholder: "Поиск услуг")
                                ForEach(filteredServices, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            
                            Picker(selection: $pickerSelection, label: Text("Транспорт")) {
                                Text("")
                                SearchBar(text: $transportSearchTerm, placeholder: "Поиск транспорта")
                                ForEach(filteredTransport, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            Picker(selection: $pickerSelection, label: Text("Общение и Советы")) {
                                Text("")
                                SearchBar(text: $communicationSearchTerm, placeholder: "Поиск советов")
                                ForEach(filteredCommunications, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            Picker(selection: $pickerSelection, label: Text("Домашняя Кулинария")) {
                                Text("")
                                SearchBar(text: $cuisineSearchTerm, placeholder: "Поиск блюд")
                                ForEach(filteredCuisine, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            Picker(selection: $pickerSelection, label: Text("Обмен валют")) {
                                Text("")
                                SearchBar(text: $moneyTransferSearchTerm, placeholder: "Поиск переводов")
                                ForEach(filteredMoneyTransfers, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            Picker(selection: $pickerSelection, label: Text("Передача Посылок")) {
                                Text("")
                                SearchBar(text: $parcelTransferSearchTerm, placeholder: "Поиск посылок")
                                ForEach(filteredParcelTransfers, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)
                            Picker(selection: $pickerSelection, label: Text("Разное")) {
                                Text("")
                                SearchBar(text: $anotherSearchTerm, placeholder: "Поиск в разном")
                                ForEach(filteredAnother, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(height: 60)
                            .accentColor(Color.primary)
                            .pickerStyle(.navigationLink)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.secondary)
                            )
                            .padding(10)

                            
                            Spacer()}
                        
                    }
                    
                   
                }
                .presentationDetents([.fraction(0.8)])
            }
            )
            .onTapGesture { hideKeyboard() }
                .sheet(isPresented: $openGallery) {
                    ImagePicker(image: self.$image)
                }
        }
        .opacity(isLoading ? 0.2 : 1.0)
        
           .disabled(isLoading)
           .simpleToast(isPresented: $showToast, options: toastOption, onDismiss: {}){
               HStack{
                   Image(systemName: "exclamationmark.circle.fill")
                   Text("Заполните все поля").bold()
                       .foregroundStyle(.primary)
               }.padding(20)
                   .background(Color.gray)
                   .foregroundColor(.white)
                   .clipShape(RoundedRectangle(cornerRadius: 12))
               
               
               
               
               
           }
        }
    }
   }
}
 
#Preview {
    NewProductView()
}
