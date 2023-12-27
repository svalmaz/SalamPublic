//
//  CategoriesAndCities.swift
//  tab
//
//  Created by agatsuma on 26/11/23.
//

import Foundation
import SwiftUI
extension View{
    func getJobCategories() -> [String]{
        let jobCategories = [
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
               "Медицина",
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
        return(jobCategories)
    }
   
}
struct BeautifulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
          configuration.label
              .padding(10)
              .foregroundColor(.white)
              .cornerRadius(8)
              .overlay(
                  RoundedRectangle(cornerRadius: 8)
                      .stroke(Color.black, lineWidth: 1)
              )
      }
}
import Foundation

struct JobCategory {
    let id: Int
    let title: String
}

let jobCategories: [JobCategory] = [
    JobCategory(id: 150, title: "Аренда квартир"),
       JobCategory(id: 151, title: "Аренда комнат"),
       JobCategory(id: 152, title: "Покупка/продажа недвижимости"),
       JobCategory(id: 153, title: "Продажа/покупка домашние вещи"),
       JobCategory(id: 154, title: "Вакансии в кафе и ресторанах"),
       JobCategory(id: 155, title: "Вакансии в IT сфере"),
       JobCategory(id: 156, title: "Работа на пикап траках и траках"),
       JobCategory(id: 157, title: "Вакансии в салонах красоты"),
       JobCategory(id: 158, title: "Другие вакансии"),
       JobCategory(id: 159, title: "Услуги салонов красоты"),
       JobCategory(id: 160, title: "Бизнес-услуги (консультации и т.д.)"),
       JobCategory(id: 161, title: "Здоровье"),
       JobCategory(id: 162, title: "Переводы документов"),
       JobCategory(id: 163, title: "Юридические услуги и услуги адвокатов"),
       JobCategory(id: 164, title: "Образование и курсы"),
       JobCategory(id: 165, title: "Байерские услуги"),
       JobCategory(id: 166, title: "Другие услуги"),
       JobCategory(id: 167, title: "Продажа готовых домашних блюд"),
       JobCategory(id: 168, title: "Рестораны, кафе"),
       JobCategory(id: 169, title: "Переводы денег Бишкек"),
       JobCategory(id: 170, title: "Переводы в Ош"),
       JobCategory(id: 171, title: "Переводы в Джалал-Абад"),
       JobCategory(id: 172, title: "Переводы в другие регионы КР"),
       JobCategory(id: 173, title: "Переводы в РФ"),
       JobCategory(id: 174, title: "Переводы в КЗ"),
       JobCategory(id: 175, title: "Переводы в другие страны"),
       JobCategory(id: 176, title: "Услуги доставки"),
       JobCategory(id: 177, title: "Передача"),
       JobCategory(id: 178, title: "Продажа/покупка автомобилей"),
       JobCategory(id: 179, title: "Продажа/покупка траков и пикап траков"),
       JobCategory(id: 180, title: "Аренда автомобилей"),
       JobCategory(id: 181, title: "Услуги для DMV и SDL"),
       JobCategory(id: 182, title: "Форум для общения и обмена советами"),
       JobCategory(id: 183, title: "Социальное взаимодействие"),
       JobCategory(id: 184, title: "BLACKLIST"),
       JobCategory(id: 185, title: "Другие объявления"),
    JobCategory(id: -1, title: "Выбрать")

]

func getCategoryId1(title: String) -> Int? {
    let cleanedTitle = title.replacingOccurrences(of: "Услуги | ", with: "").replacingOccurrences(of: "Дальнобой | ", with: "")
    
    if let category = jobCategories.first(where: { $0.title == cleanedTitle }) {
        return category.id
    } else {
        return nil
    }
    
}
func findCategoryTitle(by id: Int) -> String? {
    let foundCategory = jobCategories.first { $0.id == id }
    return foundCategory?.title
}
