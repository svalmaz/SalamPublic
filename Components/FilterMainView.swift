import SwiftUI

struct FilterMainView: View {
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
@State private var showCategories = false
       @State private var pickerSelection: String = ""
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
    @Environment(\.presentationMode) var presentetionMode
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
    @State private var selectedCity = "Нью-Йорк"
    let cities = ["Нью-Йорк", "Лос-Анджелес", "Чикаго","Хьюстон","Финикс","Филадельфия","Сан-Антонио","Сан-Диего","Даллас","Сан-Хосе","Остин","Джэксонвилл","Форт-Уэрт","Колумбус","Индианаполис"]
    
      @State private var searchCity: String = ""
    @State private var searchCityTerm: String = ""

    var filteredCity: [String] {
        cities.filter {
            searchCityTerm.isEmpty ? true : $0.lowercased().contains(searchCity.lowercased())
           }
       }
    
    @State private var selectedCategory = "Машина"
    @State private var selectedLocation = "Бишкек"
    @State private var priceRange: (start: String, end: String) = ("", "")
    @State private var selectedSort = "По умолчанию"
    @State private var searchText = ""

    let sortOptions = ["По умолчанию", "Сначала дешевые", "Сначала дорогие"]

    var body: some View {
        NavigationView {
            ZStack{
                
                Form {
                    
                    HStack{
                        
                        Button(action:{
                            presentetionMode.wrappedValue.dismiss()

                            
                          }){
                            Image(systemName: "xmark")
                                .resizable()
                            
                                .frame(width: 25, height: 25)
                            
                            
                            }.padding()
                           
                           
                        
                        Spacer()
                        Text("Фильтр")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.primary)
                        Spacer()
                        Button("Очистить"){
                            
                        }
                    }
                    Section {
                        TextField("Я ищу...", text: $searchText)
                        Button(action: {
                            
                            showCategories.toggle()
                        }) {
                            HStack{
                                Text("Категория")      .foregroundStyle(Color.primary)
                                    .font(.title3)
                                Spacer()
                                Text(pickerSelection)
                                
                                    .foregroundStyle(.secondary)
                                
                            } .frame(height:60)
                            
                            
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
                        
                        
                        
                        HStack {
                            TextField("Цена от", text: $priceRange.start)
                                .keyboardType(.numberPad)
                            TextField("Цена до", text: $priceRange.end)
                                .keyboardType(.numberPad)
                        } .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Готово") {
                                  hideKeyboard()
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Сортировать")) {
                        Picker("Сортировать", selection: $selectedSort) {
                            ForEach(sortOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button("Показать") {
                        // Действие для кнопки
                    }
                    .foregroundColor(.green)
                    Button("Найти рядом") {
                        // Действие для кнопки
                    }
                    .foregroundColor(.BG)
                }}
        }.sheet(isPresented: $showCategories, content:{
            NavigationView{
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
                    Picker( selection: $pickerSelection, label: Text("Недвижимость")) {
                        Text("")
                        SearchBar(text: $houseSearchTerm, placeholder: "Поиск")
                        ForEach(filteredHouses, id: \.self) {
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
                    Picker( selection: $pickerSelection, label: Text("Услуги")) {
                        Text("")
                        SearchBar(text: $serviceSearchTerm, placeholder: "Поиск услуг")
                        ForEach(filteredServices, id: \.self) {
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
                    Picker( selection: $pickerSelection, label: Text("Дальнобой")) {
                        Text("")
                        SearchBar(text: $carSearchTerm, placeholder: "Поиск")
                        ForEach(filteredCars, id: \.self) {
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
                    Spacer()
                    
                }
                
                
            }
            .presentationDetents([.fraction(0.8)])
            })
        
    }
}

#Preview {
    FilterMainView()
}
