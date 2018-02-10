//
//  DSAdViewController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/10.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSAdViewController: DSBaseController {

    @IBOutlet weak var bgIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "關于廣告"
        let bar = UIToolbar(frame: UIScreen.main.bounds)
        bar.barStyle = .black
        bar.alpha = 0.9
        bgIV.addSubview(bar)

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
