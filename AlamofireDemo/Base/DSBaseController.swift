//
//  DSBaseController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import Alamofire

class DSBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DSHttpManager.shareManager.request(url: "http://api.ishare.bthost.top/", parameters: nil, success: { (obj) in
            debugPrint(obj)
        }) { (error) in
            debugPrint(error)
        }
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
