//
//  ViewController.swift
//  LoginApp
//
//  Created by Robin Chou on 4/9/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let user = Auth.auth()
        if user.currentUser != nil {
            print("in")    } else {
            print("out")
        }
    }
    

    @IBAction func TapLogin(_ sender: UIButton) {
     let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else{
            return
        }
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        let authViewCOntroller = authUI!.authViewController()
        present(authViewCOntroller, animated:  true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate{
    func authUI(_ authIO: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        if error != nil {
            return
        }
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
