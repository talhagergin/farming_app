//
//  AyarlarViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 17.11.2023.
//

import UIKit
import Firebase
class AyarlarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCikis(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toGirisSayfaVC", sender: nil)
        }catch{
            print(error.localizedDescription)
        }
    }
    

}
