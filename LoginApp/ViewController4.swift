//
//  ViewController4.swift
//  LoginApp
//
//  Created by Robin Chou on 4/24/19.
//  Copyright © 2019 Robin Chou. All rights reserved.
//

import UIKit
import FirebaseUI
class ViewController4: UIViewController {
    
    let  SpaceQuiz = ["How many moons does Jupiter have?", "What is the brightest star in the Big Dipper?", "Approximately, what is the radius of the Earth at the equator?", "Which planets do not have a moon?", "when was the rover, Opportunity, decommissioned?", "what year was the last manned Moon landing?", "What is the name of NASAs first space shuttle?", "Who was the second person to walk on the moon?", "what was the first animal in space?", "What is the densest planet in our solar system?"]
    
    let SpaceQuizAnswers = [["79","60","0","53"],["Alioth","Megrez","Merak","Alkaid"],["3,963 miles","3,959 miles","1,079 miles","6,378 miles"], ["Mercury and Venus","Pluto and Jupiter","Venus and Pluto", "Neptune and Jupiter"],["2018", "1993", "2005", "2011"],["1972","1969","1970","1976"],["Enterprise","Discovery","Columbia","Galileo"],["Buzz Aldrin","Neil Armstrong","Pete Conrad","Alan Bean"],["fruit fly","rhesus monkey","dog","cat"],["Earth","Neptune","Mercury","Jupiter"]]
    
    //variables
    var currentQuestion = 0
    var correctAnswerPlacement:UInt32 = 0
    var score = 0
    var ref:DatabaseReference!

    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var QuestionNumber: UILabel!
    
    @IBAction func ButtonFunction(_ sender: UIButton) {
     
        
        
        if(sender.tag == Int(correctAnswerPlacement)){
            print("Right")
            score += 1
        }
        else {
            print("wrong")
        }
        
        if(currentQuestion != SpaceQuizAnswers.count){
            newQuestion()
        }
        else{
            let user = Auth.auth().currentUser
            ref = Database.database().reference(fromURL: "https://loginapp-4acd8.firebaseio.com/")
            //        scoreRef=Database.database().reference().child()
//            let ref = Database.database().reference()
            ref.child((user?.uid)!).setValue(["Score":score]){
                (error:Error?, ref:DatabaseReference) in
                if let error = error{
                    print("Can no save data:\(error)")
                }
                else{
                    print("yatta")
                }
            }

            performSegue(withIdentifier: "FinalScore", sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsView
        {
            let user = Auth.auth().currentUser
            let temp = segue.destination as? ResultsView
            temp?.name = user?.displayName ?? "unknown"
            temp?.score = score
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //function to display
    func newQuestion() {
        QuestionLabel.text = SpaceQuiz[currentQuestion]
        QuestionNumber.text = "Question \(currentQuestion + 1)"
        correctAnswerPlacement = arc4random_uniform(4)+1
        
        //create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...4{
            //create a button
            button = view.viewWithTag(i) as! UIButton
            
            if(i == Int(correctAnswerPlacement)){
                button.setTitle(SpaceQuizAnswers[currentQuestion][0], for: .normal )
                
            }
            else{
                button.setTitle(SpaceQuizAnswers[currentQuestion][x], for: .normal)
                x += 1
                
            }
        }
        currentQuestion += 1
    }
}
