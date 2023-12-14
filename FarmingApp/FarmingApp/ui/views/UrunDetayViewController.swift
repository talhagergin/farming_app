//
//  UrunDetayViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 15.11.2023.
//

import UIKit

class UrunDetayViewController: UIViewController {

    @IBOutlet weak var labelUrunFiyat: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    
    var urun:Urunler?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = urun{
            labelUrunAd.text = u.product_name
            imageView.image = UIImage(named: u.image!)
            labelUrunFiyat.text = "\(u.price!)₺"
        }
    }
    

  

}
