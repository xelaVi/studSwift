//
//  Base.swift
//  students
//
//  Created by Александр Иванов on 09.07.2021.
//

import Foundation

class Base {
    
    let defaults = UserDefaults.standard
    
    static let shared = Base()
    struct Students:Codable {
        var name:String
        var surname:String
        var rate:String
        var description:String{
            return "\(name) \(surname) \(rate)"
        }
    }
    
    var rating:[Students]{
        
        get{
            if let data = defaults.value(forKey: "rating") as? Data{
                return try! PropertyListDecoder().decode([Students].self, from: data)
            }else {
                return [Students]()
            }
        }
        
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "rating")
            }
        }
    }
    
    func saveRating(name:String, surname:String, rate:String){
        let studRate = Students(name: name, surname: surname, rate: rate)
        rating.insert(studRate, at: 0)
    }
}
