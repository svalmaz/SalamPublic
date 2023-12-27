//
//  LoginModel.swift
//  tab
//
//  Created by agatsuma on 26/10/23.
//

import Foundation
import SwiftUI

struct LoginUser : Codable{
    let login : String
    let name : String
    let profileImage : String
}
var userId : Int = 0
extension View{
    
    func getId() -> Int{
return(userId)    }
    func changeUserId(a: Int) {
        print(String(a) + "asdd")
        userId = a
        
    }
    func loginComand(name: String, pass: String)  -> String {
        changeUserId(a:-1)
        let url = URL(string: "http://svalmaz-001-site1.htempurl.com/api/Users/login")!
        let body: [String: Any] = ["email": name, "password": pass]
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
                if(a[3] == "failed"){
                changeUserId(a: 0)
                    LocalStorageModel.myValue =  0
                   print("failed")
                }
                else{
                    let b = a[2].split(separator: ":")
                    let c = b[0].split(separator: ",")
                    let b1 = a[9].split(separator: ":")
                    let c1 = b1[0].split(separator: ",")
                    let ss1 = Int(c[0]) ?? 0
                   print(c1)
                   print(a[9])
                    changeUserId(a: ss1)
                    LocalStorageModel.myValue = Int(c[0]) ?? 0
                    LocalStorageModel.myNameValue = String(c1[0])

                }
            }
            
                }
        task.resume()
        var gg = getId()
        while(gg == -1){
            gg = getId()
            if(gg == 0) {
                return("false")
                
            }
            else if(gg != 0 && gg != -1){
                return ( "true")
            }
        }
        return("false1")
        
        
       
        
        
    }
    func registerCommand(name: String, pass: String, email: String) -> String{
        print("a")
        changeUserId(a:-1)
        let url = URL(string: "http://svalmaz-001-site1.htempurl.com/api/Users/registration")!
        let body: [String: Any] = ["email": email, "password": pass, "name": name]
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
                print(a)
                if(a[3] == "failed"){
                    changeUserId(a: 0)
                    print("failed")
                }
                else{
                    changeUserId(a: 1)
                }
            }
          
            
                }
        task.resume()
        var gg = getId()
        while(gg == -1){
            gg = getId()
            if(gg == 0) {
                return("false")
                
            }
            else if(gg != 0 && gg != -1){
                return ( "true")
            }
        }
        return("false1")
    }
    
}
