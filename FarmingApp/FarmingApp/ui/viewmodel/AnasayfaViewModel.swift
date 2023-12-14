//
//  AnasayfaViewModel.swift
//  FarmingApp
//
//  Created by Talha Gergin on 15.11.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var urepo = UrunlerDaoRepository()
    var productList = BehaviorSubject<[Urunler]>(value: [Urunler]())
    
    init(){
        productList = urepo.productList
        urunleriYukle()
        
    }
    func urunleriYukle(){
        urepo.urunleriYukle()
    }
}
