//
//  UIColor+Extension.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//
import UIKit

extension UIColor{
        
    static var randomColor : UIColor{
        get{
            return UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
        }
    }
    
    static func hexColor(hex:UInt32)->UIColor{
        return UIColor(red: (((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0), alpha: 1.0)
    }
    
    static func rgbColor(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    

}


