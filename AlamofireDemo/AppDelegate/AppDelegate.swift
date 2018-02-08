//
//  AppDelegate.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    var window: UIWindow?
    var allowRotation = false
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = DSTabBarController();//DSNavigationController(rootViewController: DSPlayViewController())
        window?.rootViewController = DSNavigationController(rootViewController: DSHomeController())

        window?.makeKeyAndVisible()
        
        DSKT.getAll91_KDSModelSucess { (obj) in
            
            guard let array:[[String:Any]] = obj as? [[String : Any]] else {
                return
            }
//                                print(obj)

              let c = array.last
            
            DSKT.getOneProvinceAllKDSModel(withUrl: c!["provinceUrl"] as! String, sucess: { (pobj) in
                
                guard let parray:[[String:Any]] = pobj as? [[String : Any]] else {
                    return
                }
                print(pobj)

                let p = parray.first

                DSKT.getOneChannelKDSModel(withUrl: p!["provinceUrl"] as! String, sucess: { (cobj) in
                    
//                    print(cobj)
                })


            })
        }
        
        
        return true
    }

    
    

}


extension AppDelegate{
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if (allowRotation) {
            return .all;
            
        }else {
            return .portrait;
        }

    }
}
