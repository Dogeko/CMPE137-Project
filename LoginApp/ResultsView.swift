//
//  ViewController3.swift
//  LoginApp
//
//  Created by Robin Chou on 4/24/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//
//results view
import UIKit
import FirebaseUI
class ResultsView: UIViewController {
    
    var name:String=""
    var score:Int=0
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Player: \(name)"
        scoreLabel.text = "SCORE: \(score)"
//        let user = Auth.auth().currentUser
//        var ref:DatabaseReference!
//        ref = Database.database().reference(fromURL: "https://loginapp-4acd8.firebaseio.com/")
////        scoreRef=Database.database().reference().child()
//        self.ref.child("users").child((user?.uid)!).setValue(["Score",score])
            
    }
    
}
