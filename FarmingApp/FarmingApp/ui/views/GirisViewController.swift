//
//  GirisViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 16.11.2023.
//

import UIKit
import Firebase

class GirisViewController: UIViewController {

    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var tfEposta: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGirisYap(_ sender: UIButton) {
        if tfEposta.text != "" && tfSifre.text != ""{
            Auth.auth().signIn(withEmail: tfEposta.text!, password: tfSifre.text!){(authdata,error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: "Kullanıcı adı ya da şifre hatalı", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert,animated: true,completion: nil)
                    print(error?.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
                }
        }
        }else{
            let alert = UIAlertController(title: "Error", message: "Kullanıcı adı ya da şifre hatalı", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated: true,completion: nil)
        }
    }
    
}
