//
//  ContentView.swift
//  tab
//
//  Created by agatsuma on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var mainBool = false
        @State var selectTab = 0
    @State var mainOpacity : CGFloat = 1.01
    @State var accontLoginBool: Bool = true
    
    @State private var mainData: String = UserDefaults.standard.string(forKey: "accountKey") ?? ""
        var body: some View{
            NavigationView(){
                
                
                VStack{
                    
                    TabView(selection: $selectTab){
                        MainPageView()
                            .tag(0)
                        FavoritesPageView()
                            .tag(1)
                        MessagesPageView()
                            .tag(2)
                        ProfilePageView(user: profileData.init(name: "Almaz", profileImage: "https://prodm8.bsite.net/api/Users/avatar/get?userId=1", profileId: 1))
                            .tag(3)
                        NewProductView()
                            .tag(4)
                    }.overlay( alignment: .bottom){
                        tabBarView(selected: $selectTab, mainBool1: $mainBool, mainOpacity1: $mainOpacity, accountLogin: $accontLoginBool )
                    }

                    
                   
                    
                   
                 
                  
                        
                    
                   
                   
                }}
            
            }
            
    
}
struct tabBarView: View {
    @State var showSheet1: Bool = false

    @State var showSheet: Bool = false
    @State private var selection: String? = nil
        @Binding var selected : Int
    @Binding var mainBool1 : Bool
    @Binding var mainOpacity1 : CGFloat
    @Binding var accountLogin : Bool
    
    var body: some View {
        
                    
                    
                    
                    
                    
                   
                    ZStack(){
                        HStack(alignment: .bottom
                               
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
                            Spacer()
                            Button(action: {selected=1 }){
                                VStack(){
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 26, height: 25)
                                    
                                    Text("Избранное")
                                    
                                        .font(.system(size: 11))
                                    
                                    
                                }
                            }.foregroundColor(selected == 1 ? Color("BGColor") : .secondary)
                           
                            
                            
                            
                            Spacer()
                                
                            Button(action: {   
                                @State  var myData: Int = LocalStorageModel.myValue
                                if myData == 0 {
                                    showSheet.toggle()
                                    
                                    //mainBool1 = true
                                    //accountLogin = false
                                    //mainOpacity1 = 0
                                    
                            }
                            else{
                               
                                showSheet1.toggle()
                            }
                                }){ VStack{
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                      
                                        .frame(width: 60, height: 60)
                                    Text("Продать")
                                    
                                        .font(.system(size: 11))
                                   
                                }
                                }
                            
                            
                            
                            Spacer(minLength: 12)
                            Button(action: {
                               
                                LocalStorageModel.myValue =  0

                                selected=2 }){
                                VStack(alignment:.center){
                                    Image(systemName: "message.fill")
                                        .resizable()
                                    
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Чаты")
                                    
                                        .font(.system(size: 11))
                                    
                                    
                                }
                                
                                
                            }.foregroundColor(selected == 2 ? Color("BGColor") : .secondary)
                            Spacer(minLength: 12)
                            Button(action: {
                                print("asd")
                                @State  var myData: Int = LocalStorageModel.myValue
                                if myData == 0 {
                                    showSheet.toggle()
                                    
                                    //mainBool1 = true
                                    //accountLogin = false
                                    //mainOpacity1 = 0
                                    
                            }
                            else{
                                selected = 3
                            } },
                                   label: {
                                VStack(){
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Профиль")
                                    
                                        .font(.system(size: 11))
                                    
                                    
                                }.foregroundColor(selected == 3 ? Color("BGColor") : .secondary)
                            }
                                
                            
                            ).fullScreenCover(isPresented: $showSheet, content: {
                                LoginCard()
                            })
                            .fullScreenCover(isPresented: $showSheet1, content: {
                                NewProductView()
                            })
                            
                            
                            
                        }
                        
                        
                        
                    }.padding(.horizontal)
                    }
                   
                
        

}

#Preview {
    ContentView()
}
