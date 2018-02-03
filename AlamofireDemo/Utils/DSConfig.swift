//
//  DSConfig.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit


struct DSConfig {
    
    // MARK: - <color>

    static var barTintColor: UIColor {
        get {return UIColor.rgbColor(r: 51, g: 144, b: 247)}
    }
    static var tabbarTextColor: UIColor {
        get {return UIColor.rgbColor(r: 26.0, g: 26.0, b: 26.0)}
    }
    static var tabbarSelectedTextColor: UIColor {
        get {return DSConfig.barTintColor}
    }
    static var viewBackgroundColor: UIColor {
        get {return UIColor.rgbColor(r: 236, g: 237, b: 238)}
    }
    // MARK: - <font>

    static var tabBarTitleFont: UIFont {
        get{return UIFont.systemFont(ofSize: 12.0)}
    }
    static var navigationBarTitleFont: UIFont {
        get{return UIFont.systemFont(ofSize: 24.0)}
    }

}
