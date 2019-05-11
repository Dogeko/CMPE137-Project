//
//  ViewController3.swift
//  LoginApp
//
//  Created by Robin Chou on 4/24/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI
class ViewController3: UIViewController {
    let dataSource = ["Space", "Geography", "Movies", "Coding"]
    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
}

extension ViewController3: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
