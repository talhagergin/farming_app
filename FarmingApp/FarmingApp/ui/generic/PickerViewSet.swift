//
//  PickerViewSet.swift
//  FarmingApp
//
//  Created by Talha Gergin on 17.11.2023.
//

import Foundation
import UIKit

class PickerViewSet: NSObject, UIPickerViewDelegate,UIPickerViewDataSource{
    var data:[String] = []
    var didSelectRowClosure: ((String) -> Void)?
    
    func configurePickerView(pickerView: UIPickerView, data:[String],didSelectRowClosure: @escaping (String) -> Void){
        self.data = data
        self.didSelectRowClosure = didSelectRowClosure
        pickerView.delegate = self
        pickerView.dataSource = self
        print(data)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let selectedValue = data[row]
        didSelectRowClosure?(selectedValue)
        return selectedValue
    }
}
