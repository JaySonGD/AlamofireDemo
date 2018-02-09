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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 因为 presented 完成后，控制器的view的frame会错乱，需要每次将要展现的时候强制设置一下(只需在最外层的controller中设置即可)
        view.frame = UIScreen.main.bounds
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = backleftBarButtonItem()
        }
        /* 创建转场动画 */
        let transition = CATransition()
        transition.duration = 0.5; // 动画时间
        transition.type = "pageUnCurl"; // 动画样式
        transition.subtype = kCATransitionFromLeft; // 动画方向
        
        self.view.layer.add(transition, forKey: "kCATransition")
        /* 页面切换 */
        super.pushViewController(viewController, animated: false)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
//        /* 创建转场动画 */
//        let transition = CATransition()
//        transition.duration = 0.5; // 动画时间
//        transition.type = "pageCurl"; // 动画样式
//        transition.subtype = kCATransitionFromBottom; // 动画方向
//
//        self.view.layer.add(transition, forKey: "kCATransition")
        /* 页面切换 */
        return super.popViewController(animated: animated)
    }

}


extension DSNavigationController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return topViewController?.preferredStatusBarStyle ?? .default
    }

    override var prefersStatusBarHidden: Bool {
        
        return topViewController?.prefersStatusBarHidden ?? false
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return topViewController?.preferredStatusBarUpdateAnimation ?? .none
    }
    
    override var shouldAutorotate: Bool {
        return topViewController?.shouldAutorotate ?? true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
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
                /* 创建转场动画 */
                let transition = CATransition()
                transition.duration = 0.5; // 动画时间
                transition.type = "pageCurl"; // 动画样式
                transition.subtype = kCATransitionFromLeft; // 动画方向
        
                self.view.layer.add(transition, forKey: "kCATransition")

       let _ = popViewController(animated: false)
    }
}
