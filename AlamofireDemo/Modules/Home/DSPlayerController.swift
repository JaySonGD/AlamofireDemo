//
//  DSPlayerController.swift
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSPlayerController: DSBaseController {
    
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var bgIV: UIImageView!
    @IBOutlet weak var collectBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func playClick(_ sender: UIButton) {
    }
    
}


extension DSPlayerController{
    private func setUI(){
        let bar = UIToolbar(frame: UIScreen.main.bounds)
        bar.barStyle = .black
        bgIV.addSubview(bar)
    }

}
