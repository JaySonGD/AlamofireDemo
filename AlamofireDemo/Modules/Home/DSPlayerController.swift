//
//  DSPlayerController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSPlayerController: DSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DSAppDelegate.allowRotation = true;
        // Do any additional setup after loading the view.
        
        
        if let tabVC = DSAppDelegate.window?.rootViewController as? DSTabBarController {
            tabVC.tabBar.setBadgeStyle(.styleRedDot, value: 99, at: 1)

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DSAppDelegate.allowRotation = false;
        dismiss(animated: true, completion: nil)

    }
    
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
//    
//    override var shouldAutorotate: Bool{
//        return false
//    }
//    
//    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
//        return .landscapeRight
//    }
//    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
//        return .landscapeRight
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
