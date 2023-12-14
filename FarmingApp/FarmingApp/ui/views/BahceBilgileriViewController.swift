//
//  BahceBilgileriViewController.swift
//  FarmingApp
//
//  Created by Talha Gergin on 14.11.2023.
//

import UIKit

class BahceBilgileriViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var tfToprakTuru: UITextField!
    @IBOutlet weak var tfSulama: UITextField!
    @IBOutlet weak var tfGunes: UITextField!
    @IBOutlet weak var tfBahceAlan: UITextField!
    
    var generalPicker:UIPickerView?
    let pickerViews = PickerViewSet()
    let lovYesNo = ["Yes","No"]
    let toprakData = ["Kireçli","Kireçsiz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalPicker = UIPickerView()
        tfGunes.inputView = generalPicker
        tfSulama.inputView = generalPicker
        tfToprakTuru.inputView = generalPicker
        
        tfGunes.delegate = self
        tfToprakTuru.delegate = self
        tfSulama.delegate = self
        
        let dokunmaAlgilandi = UITapGestureRecognizer(target: self, action:#selector(dokunmaAlgilama))
        view.addGestureRecognizer(dokunmaAlgilandi)
    }
    
    @objc func dokunmaAlgilama(){
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfGunes{
            pickerViews.configurePickerView(pickerView:generalPicker!,data: lovYesNo){selectedValue in
                if(selectedValue == "Yes"){
                    self.tfGunes.text = "Güneş Alıyor"
                }else{
                    self.tfGunes.text = "Güneş Almıyor"
                }
                
            }
        }
          if textField == tfToprakTuru {
               pickerViews.configurePickerView(pickerView:generalPicker!,data: toprakData){selectedValue in
                   self.tfToprakTuru.text = selectedValue
               }
           }
         if textField == tfSulama {
            pickerViews.configurePickerView(pickerView:generalPicker!,data: lovYesNo){selectedValue in
                if(selectedValue == "Yes"){
                    self.tfSulama.text = "Sulamaya Çok Müsait"
                }else{
                    self.tfSulama.text = "Sulamaya Fazla Müsait Değil"
                }
            }
        }
     
       }
}
