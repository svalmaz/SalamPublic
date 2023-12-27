//
//  AppView.swift
//  tab
//
//  Created by agatsuma on 7/10/23.
//

import SwiftUI

struct AppView: View {
    
    @State var selectTab = 0
    
    var body: some View{
        TabView(selection: $selectTab){
            Text("asdd")
                .tag(0)
            Text("sdd")
                .tag(1)
            Text("sdsa")
                .tag(2)
            Text("123")
                .tag(3)
            
        }
            
        TabBarView(selected: $selectTab)
                
        }
        
    }

struct TabBarView: View {
    
    @Binding var selected : Int
    
    var body: some View {
        VStack{
            Spacer()
            ZStack(){
                HStack(alignment: .center
                       
                ){
                    Button(action: {selected=0 }){
                        VStack(){
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Главная")
                            
                                .font(.system(size: 11))
                            
                            
                        }
                    }.foregroundColor(selected == 0 ? Color("BGColor") : .secondary)
                    Spacer(minLength: 12)
                    Button(action: {selected=1 }){
                        VStack(){
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 26, height: 25)
                            
                            Text("Избранное")
                            
                                .font(.system(size: 11))
                            
                            
                        }
                    }.foregroundColor(selected == 1 ? Color("BGColor") : .secondary)
                    Spacer(minLength: 12)
                    Button(action:{}){
                        VStack{
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                            
                                .frame(width: 60, height: 60)
                            Text("Подать")
                            
                                .font(.system(size: 11))
                        }
                        
                    }
                    
                    Spacer(minLength: 12)
                    Button(action: {selected=2 }){
                        VStack(alignment:.center){
                            Image(systemName: "message.fill")
                                .resizable()
                                
                                .frame(width: 25, height: 25)
                            
                            Text("   Чаты   ")
                            
                                .font(.system(size: 11))
                            
                            
                        }
                        
                        
                    }.foregroundColor(selected == 2 ? Color("BGColor") : .secondary)
                    Spacer(minLength: 12)
                    Button(action: {selected=3 }){
                        VStack(){
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Профиль")
                            
                                .font(.system(size: 11))
                            
                            
                        }
                    }.foregroundColor(selected == 3 ? Color("BGColor") : .secondary)
                    
                    
                }
                
                
                
            }.padding()}
    }
}
#Preview {
    AppView()
}
