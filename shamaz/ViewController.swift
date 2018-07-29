//
//  ViewController.swift
//  shamaz
//
//  Created by Jorge Peguero on 7/17/18.
//  Copyright © 2018 Jorge Peguero. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    
    //-------------Referencing the Buttons
    
    @IBOutlet weak var past: UIButton!
    @IBOutlet weak var future: UIButton!
    @IBOutlet weak var whosNext: UIButton!
    
    @IBOutlet weak var textField: UILabel!
    
    var selectedFileName: String = ""
    var player: AVAudioPlayer?
    let soundArray : Array = ["note1","note2","note3","note4","note5","note6","note7"]
    
    var randomPlayerNumber : Int = 0
    let myWhiteColor = UIColor(
        white: 1.0, alpha: 0.8)
    let myColor = UIColor(red:0.43, green:0.56, blue:0.75, alpha:1.0)
    let futureArray = [" What would you like to be doing a month from now?"," What would you like to be doing 2 weeks from now? "," What would you like to be doing 3 days from now? "]
    let pastExperiences = ["what did you do last week?", "what did you do yesterday", "What did you do last monday","What did you do last weekend"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        past.layer.cornerRadius = 10;
        future.layer.cornerRadius = 10;
        whosNext.layer.cornerRadius = 10;
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 35;
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //-------------Referencing the Buttons
    
    //----------------give buttons sound
    
    @IBAction func notePressed(_ sender: UIButton) {
        selectedFileName = soundArray[Int(arc4random_uniform(UInt32(7)))]
        print(selectedFileName)
        playSound()
    }
    
    
    
    
    @IBAction func whosNext(_ sender: UIButton) {
        
        
        
        randomPlayerNumber = Int(arc4random_uniform(10)+1)
        randomNumberGenerator()
        randomColorBackGround()
        textFieldStyling()
        textField.textColor = myWhiteColor
        whosNext.backgroundColor = UIColorFromHex(rgbValue: 0xFF0000,alpha: 0.4);
        sender.isEnabled = false
        sender.shake()
        past.backgroundColor = UIColorFromHex(rgbValue: 0x7971EA,alpha: 1);
        past.isEnabled = true
        future.backgroundColor = UIColorFromHex(rgbValue: 0x495B48,alpha: 1);
        
        future.isEnabled = true
        
        
        
    }
    
    @IBAction func pastExperience(_ sender: UIButton) {
        
        
        
        textField.text =  pastExperiences[Int(arc4random_uniform(UInt32(pastExperiences.count)))]
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 40 )
        textField.textAlignment = .center
        textField.textColor = myWhiteColor
        textField.backgroundColor = randomColor()
        view.backgroundColor = myColor
        past.backgroundColor = UIColorFromHex(rgbValue: 0xFF0000,alpha: 0.4);
        whosNext.backgroundColor = UIColorFromHex(rgbValue: 0x4629F0,alpha: 1);
        whosNext.isEnabled = true
        whosNext.flash()
        
        future.backgroundColor = UIColorFromHex(rgbValue: 0x495B48,alpha: 1);
        future.isEnabled = false
        future.flash()
        
        past.pulsate()
        sender.isEnabled = false
    }
    @IBAction func futurePlan(_ sender: UIButton) {
        textField.text =  futureArray[Int(arc4random_uniform(UInt32(futureArray.count)))]
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 35 )
        textField.textColor = myWhiteColor
        textField.backgroundColor = randomColor()
        textField.textAlignment = .center
        view.backgroundColor = myColor
        future.backgroundColor = UIColorFromHex(rgbValue: 0xFF0000,alpha: 0.4);
        whosNext.backgroundColor = UIColorFromHex(rgbValue: 0x4629F0,alpha: 1);
        whosNext.isEnabled = true
        whosNext.flash()
        past.flash()
        future.pulsate()
        past.backgroundColor = UIColorFromHex(rgbValue: 0x7971EA,alpha: 1);
        past.isEnabled = false
        sender.isEnabled = false
        
    }
    
    
    //----------------function---------Random Number Generator---------------------------------
    func randomNumberGenerator() {
        textField.text =  "Player \(randomPlayerNumber)"
    }
    //----------------function---------Random Background Color  Generator---------------------------------
    func randomColorBackGround(){
        view.backgroundColor = randomColor()
    }
    //---------------function--------UI LABEL STYLING--------------------------------
    func textFieldStyling(){
        textField.font =  UIFont(name: "HelveticaNeue-UltraLight", size: 90)
        textField.textAlignment = .center
        textField.backgroundColor = randomColor()
        textField.textColor = myWhiteColor
    }
    
    
    
    
    
    //-----------------function---------Random color Generator---------------------------------
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 0.2)
    }
    //---------- color--------------------------------
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    //---------------------------------func to give buttons sound---------------------------
    func  playSound() {
        let url = Bundle.main.url(forResource: selectedFileName, withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
}

