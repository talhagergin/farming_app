//
//  UrunlerDaoRepository.swift
//  FarmingApp
//
//  Created by Talha Gergin on 14.11.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class UrunlerDaoRepository{
    
    var productList = BehaviorSubject<[Urunler]>(value: [Urunler]())
    var collectionUrunler = Firestore.firestore().collection("Urunler")
    
    func urunleriYukle(){
        
       
        
        collectionUrunler.getDocuments(completion: {snapshot,error in
            
            var list = [Urunler]()
            if let documents = snapshot?.documents{
                for document in documents {
                    let data = document.data()
                    let id = document.documentID
                    let urunad = data["product_name"] as? String ?? ""
                    let fiyat = data["price"] as? Float ?? 0 // sağ taraf eğer bir sorun olursa atanacak değeri yani default değer anlamına gelir
                    let image = data["image"] as? String ?? ""
                    let product_group_id = data["product_group_id"] as? String ?? ""
                    let field_id = data["field_id"] as? String ?? ""
                    let amount_water = data["amount_water"] as? Int ?? 0
                    let created_at = data["created_at"] as? Date ?? Date()
                    let region_id = data["region_id"] as? String ?? ""
                    
                    let urun = Urunler(product_id: id, product_name: urunad,created_at: Date(), field_id: field_id,product_group_id: product_group_id,region_id: region_id,amount_water: amount_water,image: image, price: fiyat)
                    list.append(urun)
                }
            }
            self.productList.onNext(list)
        })
    }
}
