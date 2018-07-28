//
//  Color.swift
//  shamaz
//
//  Created by Jorge Peguero on 7/26/18.
//  Copyright © 2018 Jorge Peguero. All rights reserved.
//

import Foundation
import UIKit

class Color {
    //-------------------Random color Generator---------------------------------
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 0.2)
    }
    //----------explicit  color generator--------------------------------
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}
