//
//  DSTabBarController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setViewControllers()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("Tabbar - WillAppear",view.frame)
//        // 因为 presented 完成后，控制器的view的frame会错乱，需要每次将要展现的时候强制设置一下
//        view.frame = UIScreen.main.bounds
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DSTabBarController{
    /// 设置tabBar盛放的视图控制器
    func setViewControllers() -> Void {
        
        //        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey(rawValue: NSForegroundColorAttributeName):UIColor.red], for: .normal)
        
        setChildControllers(viewController: DSPlayViewController(), title: "HOME", image: "<#T##String#>", selectedImage: "<#T##String#>")
        setChildControllers(viewController: DSBaseController(), title: "HOME", image: "<#T##String#>", selectedImage: "<#T##String#>")
        setChildControllers(viewController: DSBaseController(), title: "HOME", image: "<#T##String#>", selectedImage: "<#T##String#>")
        
    }
    
    
    func setChildControllers(viewController:UIViewController,
                             title:String,
                             image:String,
                             selectedImage:String) -> Void {
        let NavVC = DSNavigationController(rootViewController: viewController)
        NavVC.tabBarItem.title = title
        NavVC.tabBarItem.selectedImage = UIImage(named: selectedImage)
        NavVC.tabBarItem.image = UIImage(named: image)
        NavVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:DSConfig.tabbarTextColor,NSAttributedStringKey.font:DSConfig.tabBarTitleFont], for: .normal)
        NavVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:DSConfig.tabbarSelectedTextColor,NSAttributedStringKey.font:DSConfig.tabBarTitleFont], for: .selected)
        
        addChildViewController(NavVC)
    }

}

extension DSTabBarController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return selectedViewController?.prefersStatusBarHidden ?? false
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return selectedViewController?.preferredStatusBarUpdateAnimation ?? .none
    }
    
    override var shouldAutorotate: Bool {
        return selectedViewController?.shouldAutorotate ?? true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return selectedViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }

}
