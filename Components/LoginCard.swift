//
//  LoginCard.swift
//  tab
//
//  Created by agatsuma on 18/10/23.
//

import SwiftUI
import SlidingTabView
import SimpleToast

struct LoginCard: View {
    @State private var showLoginToast = false
    @State private var showRegisterToast = false
    @State private var showRegisterSuccessToast = false

    
    private let toastOption = SimpleToastOptions(alignment: .top, hideAfter: 2, backdropColor: Color.gray, animation: .default, modifierType: .slide)
    
    
    @FocusState private var nameIsFocused: Bool
    @State var navigated = true
    @Environment(\.presentationMode) var presentetionMode
    @State private var tabindex = 0
    @State private var loginUsername = ""
    @State private var loginPassword = ""
    @State private var registerEmail = ""
    @State private var registerPassword = ""
    @State private var registerName = ""
    private var isLoginButtonDisbled: Bool{
        loginUsername.isEmpty || loginPassword.isEmpty
    }
    private var isRegisterButtonDisabled: Bool{
        registerName.isEmpty || registerEmail.isEmpty || registerPassword.isEmpty 
    }
    
    var body: some View {
        ZStack{
            
       
        VStack{
            HStack(){
                Button(action:{ presentetionMode.wrappedValue.dismiss()}){
                    Image(systemName: "xmark")
                        .resizable()
                        
                        .frame(width: 25, height: 25)
                        
                       
                }
                .padding(10)
                .foregroundStyle(.secondary)
                
                Spacer()
               
                
            }
            Image("mainlogo")
                .resizable()
                .frame(width: 170, height: 170)
            Text("Salam")
                .font(.system(size: 40))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.BG)
            SlidingTabView(selection: $tabindex, tabs: [" Вход","Регистрация"], activeAccentColor: .BG,inactiveAccentColor: .gray, selectionBarColor: .BG )
                
            
            
            if tabindex == 0{
                VStack{
                    VStack(spacing: 15){
                        TextField("", text: $loginUsername, prompt: Text("Логин"))
                            .customStyle()
                        SecureField("Пароль", text:$loginPassword)
                            .customStyle()
                        
                    }
                    .padding()
                    Button(action: {
                        let a =  loginComand(name: loginUsername, pass: loginPassword)
                        if(a == "false"){
                            hideKeyboard()
                            showLoginToast.toggle()
                          
                        }
                        else{
                            presentetionMode.wrappedValue.dismiss()

                        }
                      
                       })
                    {
                        Text("Войти")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, height: 60)
                            
                            .foregroundStyle(.white
                            )
                    }
                    .frame(width: 300, height: 60)
                    .background(.BG)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .disabled(isLoginButtonDisbled)
                    .padding()
                    Button(action:{ }){
                        Text("Забыли пароль")
                            .fontWeight(.bold)
                            .foregroundStyle(.gray)
                            
                    }
                }
                
            }
            if tabindex == 1{
                ScrollView{
                    
                    
                    VStack{
                        VStack(spacing: 15){
                            
                            TextField("Почта", text: $registerEmail)
                                .customStyle()
                            TextField("Имя", text: $registerName)
                                .customStyle()
                            
                            
                            SecureField("Пароль", text:$registerPassword)
                                .customStyle()
                            
                        }
                        .padding()
                        Button(action:{let a = registerCommand(name: registerName, pass: registerPassword, email: registerEmail)
                            if(a == "false"){
                                showRegisterToast.toggle()
                                
                            }
                            else{
                                showRegisterSuccessToast.toggle()
                               
                            }})
                        {
                            Text("Зарегистрироваться")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white
                                ).frame(width: 300, height: 60)
                        }
                        .frame(width: 300, height: 60)
                        .background(.BG)
                        
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .disabled(isRegisterButtonDisabled)
                        .padding()
                        
                    }
                    VStack{
                        
                    }.frame(height: 100)
                }}
            Spacer()
           
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            if !navigated{
            
                ContentView()
                    .transition(AnyTransition.move(edge: .bottom))
               
            }
        }.simpleToast(isPresented: $showLoginToast, options: toastOption, onDismiss: {}){
            HStack{
                Image(systemName: "person.crop.circle.fill.badge.xmark")
                Text("Неправильный логин или пароль").bold()
            }.padding(20)
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }.simpleToast(isPresented: $showRegisterToast, options: toastOption, onDismiss: {}){
            HStack{
                Image(systemName: "person.crop.circle.fill.badge.xmark")
                Text("Данная почта уже зарегистрирована").bold()
            }.padding(20)
            .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        
            
            
            
            
            
        }.simpleToast(isPresented: $showRegisterSuccessToast, options: toastOption, onDismiss: {}){
            HStack{
                Image(systemName: "person.fill.checkmark")
                Text("Регистрация прошла успешно!").bold()
            }.padding(20)
            .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        
            
            
            
            
            
        }
    }
}

//#Preview {
 //   LoginCard()
//}
struct TFStyleViewModifier: ViewModifier{
    func body(content: Content) ->some View{
        content.padding()
           
            .submitLabel(.done)
            .frame(width: 300)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension View{
    
    func customStyle() -> some View {
        modifier(TFStyleViewModifier())
    }
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
   
    
}
#Preview {
    LoginCard()
}
