//
//  ViewController.swift
//  UIPickerViewSample
//
//  Created by Kap's on 11/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favouiteDayTextField: UITextField!
    
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday",]
    var selectedDay : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPickerView()
        createToolBar()
    }
    
    func createPickerView() {
        
        let pickerDay = UIPickerView()
        pickerDay.delegate = self
        
        favouiteDayTextField.inputView = pickerDay
    }
    
    func createToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        favouiteDayTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController : UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        favouiteDayTextField.text = selectedDay
    }
}


