//
//  DSWKController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/8.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import WebKit

class DSWKController: DSBaseController {

    
    
    lazy var webView: WKWebView = {
        
        let web = WKWebView(frame: UIScreen.main.bounds)
        
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


extension DSWKController{
    func setUI()  {
        view.addSubview(webView)
        
    }
}
