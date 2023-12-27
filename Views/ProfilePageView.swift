//
//  ProfilePageView.swift
//  tab
//
//  Created by agatsuma on 7/10/23.
//

import SwiftUI
import PhotosUI
struct ProfilePageView: View {
    @State private var image : UIImage?
    @State private var showSheet = false
    @State var isOpen = false
    @State var refreshMe = false
    @State private var loginUsername = ""
    @StateObject var viewModel = AdvertisementsViewModel()

    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]
  
    @State var userImage = "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/get?userId=" + String(LocalStorageModel.myValue)
    @State var id = UUID()
    var user: profileData
    
    var body: some View {
        ScrollView{
            VStack{
                
                
                Button(action:{showSheet = true
                    
                } ){AsyncImage(url: URL(string: "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/get?userId=" + String(LocalStorageModel.myValue))) { image in
                    // Этот блок будет выполнен, когда изображение загрузится
                    image
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                } placeholder: {
                    // Этот блок будет показан, пока изображение загружается
                    ProgressView()
                }
                
                .frame(width: 120, height: 120)
                    
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                
                .id(id)}
                   
                HStack{
                    Text(LocalStorageModel.myNameValue)
                        .font(.system(size: 26))
                        .fontWeight(.semibold)
                        
                    /*Button(action:{ isOpen = true}){
                        Image(systemName: "pencil")
                    } .alert("Изменить", isPresented: $isOpen) {
                        TextField("Имя", text: $loginUsername)
                            .textInputAutocapitalization(.never)
                       
                        Button("OK", action: {LocalStorageModel.myNameValue = loginUsername
                        })
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Пожалуйста напишите свое имя")
                    }.foregroundStyle(.secondary)*/
                }
                Text("Активные объявления").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(30).foregroundStyle(.blue)
                    
                
                
                Spacer()
                
            }
            
            .padding(.horizontal, 20)
            .sheet(isPresented: $showSheet) {
                ImagePicker(image: self.$image)
            }
            .onChange(of: image) {
                if let img = $0 {
                    
                    let a = convertImageToBase64String(img: image ?? UIImage(resource: .secondVideo))
                    uploadAvatar(id: LocalStorageModel.myValue, avatar: a);
                    
                    id = UUID()
                    
                    
                }
            }
          
        ScrollView{
            
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(viewModel.advertisements) { product in
                    AdvertCard(advert: product)
                }
            }
        }
        }.refreshable {
                viewModel.loadAdvertisements(req: "https://svalmaz-001-site1.htempurl.com/api/Users/adv/get?userId=" + String(LocalStorageModel.myValue))
            }
            .onAppear(){
                viewModel.loadAdvertisements(req: "https://svalmaz-001-site1.htempurl.com/api/Users/adv/get?userId=" + String(LocalStorageModel.myValue))
            }
        
    }}
   
#Preview {
    ProfilePageView(user: profileData.init(name: "Almaz", profileImage: "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/get?userId=4", profileId: 4))
}
