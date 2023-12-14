import UIKit

class GenelBilgilerViewController: UIViewController,UITextFieldDelegate{
    // Liste içeriği için bir dizi tanımlayın
    let urungrubu = ["Meyve", "Sebze", "Tahıl"]
    let bolgedata = ["Karadeniz","Akdeniz","Marmara"]
    let sehirdata = ["Samsun","Antalya","İstanbul"]
    @IBOutlet weak var grupPicker: UIPickerView!
    @IBOutlet weak var tfSehir: UITextField!
    @IBOutlet weak var tfBolge: UITextField!
    @IBOutlet weak var tfUrunGrubu: UITextField!
    
    var generalPicker:UIPickerView?
    let pickerView = PickerViewSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalPicker = UIPickerView()
        tfBolge.inputView = generalPicker
        tfSehir.inputView = generalPicker
        tfUrunGrubu.inputView = generalPicker
        
        tfBolge.delegate = self
        tfSehir.delegate = self
        tfUrunGrubu.delegate = self
     
        let dokunmaAlgilandi = UITapGestureRecognizer(target: self, action:#selector(dokunmaAlgilama))
        view.addGestureRecognizer(dokunmaAlgilandi)

    }
    @objc func dokunmaAlgilama(){
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tfUrunGrubu{
            pickerView.configurePickerView(pickerView:generalPicker!,data: urungrubu){selectedValue in
                self.tfUrunGrubu.text = selectedValue
            }
        }
          if textField == tfBolge {
               pickerView.configurePickerView(pickerView:generalPicker!,data: bolgedata){selectedValue in
                   self.tfBolge.text = selectedValue
               }
           }
         if textField == tfSehir {
            pickerView.configurePickerView(pickerView:generalPicker!,data: sehirdata){selectedValue in
                self.tfSehir.text = selectedValue
            }
        }
     
       }
    
    
   
}
