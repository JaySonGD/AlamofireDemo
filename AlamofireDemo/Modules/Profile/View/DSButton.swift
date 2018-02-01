//
//  DSButton.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .center
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        setTitleColor(UIColor.black, for: .normal)
//        titleLabel?.backgroundColor = UIColor.white
//        imageView?.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.frame = CGRect(x: 0, y: height * (0.45 + 0.1), width: width, height: height*0.45)
        imageView?.frame = CGRect(x: 0, y: height * 0.1, width: width, height: height * 0.45)
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        var frame  = contentRect
//
//        frame.origin.x = self.frame.size.width/2 - frame.size.width/2
//        frame.origin.y = self.frame.size.height/2 - frame.size.height/2
//        return frame
//    }
//
//    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
//        var frame  = contentRect
//
//        frame.origin.x = self.frame.size.width
//        frame.origin.y = self.frame.size.height/2 - frame.size.height/2
//        return frame
//    }

}
