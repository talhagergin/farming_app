//
//  AnalizYukleniyorViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 20.11.2023.
//

import UIKit

class AnalizYukleniyorViewController: UIViewController {

    @IBOutlet weak var indicatorOutllet: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorOutllet.isHidden = false
        indicatorOutllet.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.indicatorOutllet.isHidden = true
            self.indicatorOutllet.stopAnimating()
            self.performSegue(withIdentifier: "toOnerilenUrunler", sender: nil)
               }
    }
    

}
