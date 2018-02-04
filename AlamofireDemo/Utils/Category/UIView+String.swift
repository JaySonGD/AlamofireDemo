//
//  UITableViewCell+String.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

extension UIView{
   static var className: String {
        get {
            let name : NSString = NSStringFromClass(self.self) as NSString
            return ((name.pathExtension).characters.count  > 1) ? name.pathExtension : (name as String)
        }
    }
}
