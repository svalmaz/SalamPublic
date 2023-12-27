//
//  UploadAvatar.swift
//  tab
//
//  Created by agatsuma on 8/11/23.
//

import Foundation
import SwiftUI
func uploadAvatar(id: Int, avatar: String){
    print("asd")
    let url = URL(string: "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/upload")!
    let body: [String: Any] = ["id": id, "avatar": avatar]
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
     let task =  URLSession.shared.dataTask(with: request) { data, response, error in
               
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }

        do{
            
            let str = String(decoding: data, as: UTF8.self)
            let a = str.split(separator: "\"")
            print(str)
            
        }
        
            }
    task.resume()
  





}
func uploadName(id: Int, avatar: String){
    print("asd")
    let url = URL(string: "https://svalmaz-001-site1.htempurl.com/api/Users/avatar/upload")!
    let body: [String: Any] = ["id": id, "avatar": avatar]
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
     let task =  URLSession.shared.dataTask(with: request) { data, response, error in
               
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }

        do{
            
            let str = String(decoding: data, as: UTF8.self)
            let a = str.split(separator: "\"")
            print(str)
            if(a[3] == "failed"){
            
               
               print("failed")
            }
            else{
                
                 }
        }
        
            }
    task.resume()
  





}
func getSafeImage(named: [UIImage]) -> UIImage {
    var a = 0
    for _ in named {
        a+=1
        
    }
    if(a == 0){
       return UIImage(systemName: "camera.shutter.button.fill")!
    }
    else{
        return named[0]
    }

}
struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator

        searchBar.placeholder = placeholder
        searchBar.autocapitalizationType = .none
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
