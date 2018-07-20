//
//  ViewController.swift
//  shamaz
//
//  Created by Jorge Peguero on 7/17/18.
//  Copyright © 2018 Jorge Peguero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomPlayerNumber : Int = 0
    let myRedColor = UIColor(
        white: 1.0, alpha: 0.8)
    let myColor = UIColor(red:0.43, green:0.56, blue:0.75, alpha:1.0)
    let futureArray = ["What would you like to be doing a month from now?","What would you like to be doing 2 weeks from now?","What would you like to be doing 3 days from now?"]
    let pastExperiences = ["what did you do last week?", "what did you do yesterday", "What did you do last monday","What did you do last weekend"]

    @IBOutlet weak var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func whosNext(_ sender: UIButton) {
        randomPlayerNumber = Int(arc4random_uniform(10)+1)
        randomNumberGenerator()
        sender.shake()
    }
    
    @IBAction func pastExperience(_ sender: UIButton) {
        textField.text =  pastExperiences[Int(arc4random_uniform(UInt32(pastExperiences.count)))]
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 40 )
        textField.textAlignment = .center
        textField.textColor = randomColor()
        textField.backgroundColor = myRedColor
        view.backgroundColor = myColor
        
         sender.shake()
    }
    @IBAction func futurePlan(_ sender: UIButton) {
        textField.text =  futureArray[Int(arc4random_uniform(UInt32(futureArray.count)))]
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 35 )
        textField.textColor = randomColor()
        textField.backgroundColor = myRedColor
        view.backgroundColor = myColor
        textField.textAlignment = .center
        sender.shake()
        
    }
    
    func randomNumberGenerator(){
        textField.text =  "Player \(randomPlayerNumber)"
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 90)
        textField.textAlignment = .center
        view.backgroundColor = randomColor()
        textField.backgroundColor = randomColor()
     
    }
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}

