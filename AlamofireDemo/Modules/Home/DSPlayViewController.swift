//
//  DSPlayViewController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SnapKit

class DSPlayViewController: DSBaseController {
    
    lazy var playView : UIView = {
        let playView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 9 * kScreenWidth / 16.0))
        playView.backgroundColor = UIColor.black
        
        return playView
    }()
    
    lazy var fullButton :UIButton = {
       
        let button = UIButton(type: UIButtonType.custom)
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(DSPlayViewController.fullAction(btn:)), for: .touchUpInside)
        return button
    }()

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
    }

    
//    override var prefersStatusBarHidden: Bool{
//        return false
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
//
//    override var shouldAutorotate: Bool{
//        return false
//    }
//
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
//        return .portrait
//    }
//
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
//        return .portrait
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

extension DSPlayViewController{
    @objc fileprivate func fullAction(btn:UIButton){
        print("23")
        
        present(DSPlayerController(), animated: true, completion: nil)
        
    }
}

extension DSPlayViewController{
    fileprivate func setUI(){
        view.addSubview(playView)
        playView.addSubview(fullButton)
        fullButton.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(44)
            make.right.bottom.equalTo(playView).offset(-12)
        }
        
//        self.prefersStatusBarHidden = true
//        self.preferredStatusBarStyle = .lightContent

    }
}


