//
//  ViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 13.11.2023.
//

import UIKit
import RxSwift
import FirebaseFirestore

class AnasayfaViewController: UIViewController {
    @IBOutlet weak var urunlerCollection: UICollectionView!
    var urunlerListesi = [Urunler]()
    var viewModel = AnasayfaViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urunlerCollection.delegate = self
        urunlerCollection.dataSource = self
        
        _ = viewModel.productList.subscribe(onNext: {liste in
            self.urunlerListesi = liste
            DispatchQueue.main.async {//Daha senkronize ve hızlı çalışması için
                self.urunlerCollection.reloadData()
            }
            
        })
        
        let apperance = UINavigationBarAppearance()
        
        apperance.backgroundColor = UIColor(named: "mainColor")
        apperance.titleTextAttributes = [.foregroundColor:UIColor(named: "fontColorDark")!]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
     
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        //10 X 10 X 10 = 30
        //15 X 10 X 10 X 15 = 50
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        urunlerCollection.collectionViewLayout = tasarim
        
    }

}

extension AnasayfaViewController :  UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urun = urunlerListesi[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "urunlerHucre", for: indexPath) as! UrunlerHucreCollectionViewCell
    
        hucre.labelUrunAd.text = urun.product_name
        hucre.imageView.image = UIImage(named: urun.image!)
        hucre.labelFiyat.text = "\(urun.price!)₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let urun = sender as? Urunler{
                let gidilecekVC = segue.destination as! UrunDetayViewController
                gidilecekVC.urun = urun
            }
        }
    }
}

