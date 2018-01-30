//
//  DSNavigationController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setnavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setnavigationBar() -> Void {
        self.navigationBar.barTintColor = DSConfig.barTintColor // title
        self.navigationBar.tintColor = UIColor.white // backprint(__FUNCTION__)
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font : DSConfig.navigationBarTitleFont,NSAttributedStringKey.foregroundColor: UIColor.red];
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

}
