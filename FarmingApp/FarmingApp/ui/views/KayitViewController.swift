//
//  KayitViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 16.11.2023.
//

import UIKit
import Firebase
class KayitViewController: UIViewController {

    @IBOutlet weak var tfAd: UITextField!
    
    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var tfEposta: UITextField!
    @IBOutlet weak var tfYas: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnKayitOl(_ sender: UIButton) {
        if tfEposta.text != "" && tfSifre.text != "" {
            Auth.auth().createUser(withEmail: tfEposta.text!, password: tfSifre.text!){(authdata,error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    print("kullanıcı oluşturuldu")
                    //self.performSegue(withIdentifier: "toAnasayfaVC", sender: nil)
                }
            }
                
            
        }
        else{
            makeAlert(titleInput: "Error!", messageInput: "E-posta ve şifre alanlarini doldurunuz")
        }
        
    }
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
    

}
