//
//  ViewController2.swift
//  LoginApp
//
//  Created by Robin Chou on 4/9/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI
class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func TapLogOff(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        performSegue(withIdentifier: "LogOff", sender: self)
    }
    
    
}
