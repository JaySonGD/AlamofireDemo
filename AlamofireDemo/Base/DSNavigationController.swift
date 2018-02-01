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

//    override var prefersStatusBarHidden: Bool{
//        return (viewControllers.last?.prefersStatusBarHidden)!
//    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
//
//    override var shouldAutorotate: Bool{
//        return (viewControllers.last?.shouldAutorotate)!
//    }
//    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
//        return (viewControllers.last?.supportedInterfaceOrientations)!
//    }
//    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
//        return (viewControllers.last?.preferredInterfaceOrientationForPresentation)!
//    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = backleftBarButtonItem()
        }
        super.pushViewController(viewController, animated: true)
    }

}

extension DSNavigationController{
    fileprivate func setnavigationBar() -> Void {
        self.navigationBar.barTintColor = DSConfig.barTintColor // bg
        self.navigationBar.tintColor = UIColor.white // back
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font : DSConfig.navigationBarTitleFont,NSAttributedStringKey.foregroundColor: UIColor.white];
    }
    fileprivate func backleftBarButtonItem()->UIBarButtonItem{
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        backButton.size = CGSize(width: 22, height: 44)
        backButton.addTarget(self, action: #selector(DSNavigationController.back), for: .touchUpInside)
        let back = UIBarButtonItem(customView: backButton)
        return back;
        
    }
    @objc fileprivate func back(){
        popViewController(animated: true)
    }
}
