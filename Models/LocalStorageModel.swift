//
//  LocalStorageModel.swift
//  tab
//
//  Created by agatsuma on 21/10/23.
//

import Foundation
class LocalStorageModel{
    private static var myKey: String = "myKey"
    private static var myNameKey: String = "myNameKey"

    public static var myValue: Int{
        set{
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get{
            return UserDefaults.standard.integer(forKey: myKey)
        }
    }
    public static var myNameValue: String{
        set{
            UserDefaults.standard.set(newValue, forKey: myNameKey)
        }
        get{
            return UserDefaults.standard.string(forKey: myNameKey) ?? ""
        }
    }
  
}
