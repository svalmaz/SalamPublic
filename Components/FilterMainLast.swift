import SwiftUI
import MapKit
import CoreLocation
struct FilterMainLast: View {
    
   
    
    @State private var selectedCity = "Выбрать"
    let cities = ["Нью-Йорк", "Лос-Анджелес", "Чикаго","Хьюстон","Финикс","Филадельфия","Сан-Антонио","Сан-Диего","Даллас","Сан-Хосе","Остин","Джэксонвилл","Форт-Уэрт","Колумбус","Индианаполис"]
    @Binding   var req: String
      @State private var searchCity: String = ""
    @State private var searchCityTerm: String = ""
   
    var filteredCity: [String] {
        cities.filter {
            searchCityTerm.isEmpty ? true : $0.lowercased().contains(searchCity.lowercased())
           }
       }
    
    ///////
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

    @State private var showCategories = false
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
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
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
    let anotherOptions = [
            "Разное"
           
        ]
        @State private var anotherSearchTerm: String = ""

        var filteredAnother: [String] {
            anotherOptions.filter {
                anotherSearchTerm.isEmpty ? true : $0.lowercased().contains(anotherSearchTerm.lowercased())
            }
        }
    
    
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var selectedCategory: String = "Машины"
    @State private var priceFrom: String = ""
    @State private var priceTo: String = ""
    @State private var sortOrder: String = "По умолчанию"

    let categories = ["Машины: Продаю машины", "Машины: Куплю машины", "Дома: Продаю дома", "Дома: Куплю дома"]
    let sortOrders = ["По умолчанию", "Сначала дешевые", "Сначала дорогие"]

    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Text("Фильтр")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        
                        Button("Очистить") {
                            resetFilters()
                        }
                        .foregroundColor(.blue)
                    }.padding()
                    
                    TextField("Название", text: $title)
                        .padding()
                        .font(.title3)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    Text("Категории")
                        .padding(10)
                        .fontWeight(.bold) // Делает текст жирным
                        .frame(maxWidth: .infinity, alignment: .leading) // Выравнивает текст по левому краю
                        .padding(.horizontal)
                        .padding(.top, 15)
                    
                   
                        
                    Button(action: {
                        showCategories.toggle()
                    }) {
                        HStack {
                            Text(pickerSelection)
                                .foregroundStyle(Color.secondary)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                    Text("Город ")
                        .padding(10)
                        .fontWeight(.bold) // Делает текст жирным
                        .frame(maxWidth: .infinity, alignment: .leading) // Выравнивает текст по левому краю
                        .padding(.horizontal)
                        .padding(.top, 15)
                   
                    Button(action: {
                        showCities.toggle()
                    }) {
                        HStack {
                            Text(selectedCity)
                                .foregroundStyle(Color.secondary)
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .padding(.horizontal)
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                    HStack {
                        TextField("Цена от", text: $priceFrom)
                            .keyboardType(.numberPad)
                        TextField("Цена до", text: $priceTo)
                            .keyboardType(.numberPad)
                    } .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Готово") {
                                hideKeyboard()
                            }
                        }}
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Picker("Сортировка", selection: $sortOrder) {
                        ForEach(sortOrders, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    Text("Расстояние: \(Int(distance)) км")
                        .padding(10)
                        .fontWeight(.bold) // Делает текст жирным
                        .frame(maxWidth: .infinity, alignment: .leading) // Выравнивает текст по левому краю
                        .padding(.horizontal)
                        .padding(.top, 15)

                               // Слайдер
                               Slider(value: $distance, in: 1...50, step: 1)
                                   .padding()
                                  
                                   
                    Button(action: {
                        
                        let category = getCategoryId1(title: pickerSelection)
                        let city = getCityId(cityName: selectedCity)
                        if(title == ""){
                            title = "null"
                        }
                        if(priceFrom == ""){
                            priceFrom = "-1"
                        }
                        if(priceTo == ""){
                            priceTo = "-1"
                        }
                        let url = generateApiUrl(title: title, priceFrom: Int(priceFrom) ?? -1, priceTo: Int(priceTo) ?? -1, page: 1, cityId: city ?? -1, categoryId: category ?? -1, minLatitude: -1, minLongitude: -1, maxLatitude: -1, maxLongitude: -1)
                        req = url.absoluteString
                        print(req)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Показать")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        if let currentLocation = locationManager.location?.coordinate {
                            region = MKCoordinateRegion(
                                center: currentLocation,
                                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                            )
                        }
                        let latitude = Double(self.region.center.latitude)
                        let longitude = Double(self.region.center.longitude)
                        let deltaLat: Double = Double(distance / 111.0)
                        let deltaLon: Double = Double(distance / 85.0)
                        let maxLat = latitude+deltaLat;
                        let minLat = latitude-deltaLat;
                        let maxLon = longitude+deltaLon;
                        let minLon = longitude-deltaLon;
                        let category = getCategoryId1(title: pickerSelection)
                        let city = getCityId(cityName: selectedCity)
                        if(title == ""){
                            title = "null"
                        }
                        if(priceFrom == ""){
                            priceFrom = "-1"
                        }
                        if(priceTo == ""){
                            priceTo = "-1"
                        }
                        let url = generateApiUrl(title: title, priceFrom: Int(priceFrom) ?? -1, priceTo: Int(priceTo) ?? -1, page: 1, cityId: city ?? -1, categoryId: category ?? -1, minLatitude: minLat, minLongitude: minLon, maxLatitude: maxLat, maxLongitude: maxLon)
                        req = url.absoluteString
                        print(req)
                        presentationMode.wrappedValue.dismiss()

                        //let minlat =
                        //let minlon
                        //let maxlat
                        //let maxlon
                     
                    }) {
                        Text("Найти рядом")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                .padding()
               
                .navigationBarHidden(true)
                Spacer()
            }
            .sheet(isPresented: $showCities, content:{
                NavigationView{
                    ScrollView{
                        VStack{
                            
                            Text("Штаты").padding(40)
                                .bold()
                                .foregroundStyle(.primary)
                            Picker( selection: $selectedCity, label: Text("Город").font(.title3)) 
                            {
                                Text("")
                                
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
                        }
                    }
                    
                }
                
            })
            .sheet(isPresented: $showCategories, content:{
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
                .presentationDetents([.fraction(0.8)])})
        }
            
    }

                private func resetFilters() {
                    pickerSelection = "Выбрать"
                    selectedCity = "Выбрать"
                    title = ""
                   
                    priceFrom = ""
                    priceTo = ""
                    sortOrder = sortOrders.first ?? ""
                    distance = 5
                }
    private func getCoordinate(){
        if let currentLocation = locationManager.location?.coordinate {
            region = MKCoordinateRegion(
                center: currentLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            )
        }
    }
    func generateApiUrl(title: String, priceFrom: Int, priceTo: Int, page: Int, cityId: Int, categoryId: Int, minLatitude: Double, minLongitude: Double, maxLatitude: Double, maxLongitude: Double) -> URL {
        var components = URLComponents(string: "https://svalmaz-001-site1.htempurl.com/api/Advert/filter")

        let queryItems = [
            URLQueryItem(name: "title", value: title),
            URLQueryItem(name: "minprice", value: "\(priceFrom)"),
            URLQueryItem(name: "maxprice", value: "\(priceTo)"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "cityId", value: "\(cityId)"),
            URLQueryItem(name: "categoryId", value: "\(categoryId)"),
            URLQueryItem(name: "minlatitude", value: "\(minLatitude)"),
            URLQueryItem(name: "minlongitude", value: "\(minLongitude)"),
            URLQueryItem(name: "maxlatitude", value: "\(maxLatitude)"),
            URLQueryItem(name: "maxlongitude", value: "\(maxLongitude)")
        ]

        components?.queryItems = queryItems

        return components?.url ?? URL(string:"https://localhost:7253/api/Advert/filter?title=null&minprice=-1&maxprice=-1&page=-1&cityId=-1&categoryId=-1&minlatitude=-1&minlongitude=-1&maxlatitude=-1&maxlongitude=-1")!
    }
}

