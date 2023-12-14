//
//  Users.swift
//  FarmingApp
//
//  Created by Talha Gergin on 14.11.2023.
//

import Foundation
class Users{
    var user_id:String?
    var username:String?
    var password:String?
    var name:String?
    var surname:String?
    var email:String?
    var city:String?
    var age:Int?
    var created_at:Date?
    
    init(){
        
    }
    
    init(user_id: String? = nil, username: String? = nil, password: String? = nil, name: String? = nil, surname: String? = nil, email: String? = nil, city: String? = nil, age: Int? = nil, created_at: Date? = nil) {
        self.user_id = user_id
        self.username = username
        self.password = password
        self.name = name
        self.surname = surname
        self.email = email
        self.city = city
        self.age = age
        self.created_at = created_at
    }
}
