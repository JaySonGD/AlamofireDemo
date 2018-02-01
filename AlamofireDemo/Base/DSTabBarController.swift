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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        
        return (selectedViewController?.childViewControllers.last?.prefersStatusBarHidden) ?? false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return (selectedViewController?.childViewControllers.last?.preferredStatusBarStyle) ?? .default
    }
    
    override var shouldAutorotate: Bool{
        return (selectedViewController?.childViewControllers.last?.shouldAutorotate) ?? false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
        return (selectedViewController?.childViewControllers.last?.supportedInterfaceOrientations) ?? .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return (selectedViewController?.childViewControllers.last?.preferredInterfaceOrientationForPresentation) ?? .portrait
    }

    
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
