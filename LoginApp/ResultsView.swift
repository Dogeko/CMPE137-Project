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
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Player: \(name)"
        scoreLabel.text = "SCORE: \(score)"
    }
    
}
