//
//  Urunler.swift
//  FarmingApp
//
//  Created by Talha Gergin on 14.11.2023.
//

import Foundation
class Urunler{
    var product_id:String?
    var product_name:String?
    var created_at:Date?
    var field_id:String?
    var product_group_id:String?
    var region_id:String?
    var amount_water:Int?
    var image:String?
    var price:Float?
    
    init(){
        
    }
    
    init(product_id: String? = nil, product_name: String? = nil, created_at: Date? = nil, field_id: String? = nil, product_group_id: String? = nil, region_id: String? = nil, amount_water: Int? = nil,image:String? = nil,price:Float?) {
        self.product_id = product_id
        self.product_name = product_name
        self.created_at = created_at
        self.field_id = field_id
        self.product_group_id = product_group_id
        self.region_id = region_id
        self.amount_water = amount_water
        self.image = image
        self.price = price
        
    }
}
