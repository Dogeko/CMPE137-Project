//
//  ViewController5.swift
//  LoginApp
//
//  Created by Kevin on 5/5/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController5: UIViewController {
    
    @IBOutlet weak var UserLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = Auth.auth().currentUser
        {
            let name = user.displayName
            let email = user.email
            self.UserLabel.text = name
            self.EmailLabel.text = email
        }
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
