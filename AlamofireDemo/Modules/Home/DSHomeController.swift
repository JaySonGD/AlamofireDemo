//
//  DSHomeController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSHomeController: DSBaseController {

    lazy var profileItem :UIBarButtonItem = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "back"), for: .highlighted)
        btn.size = CGSize(width: 22, height: 44)
        btn.addTarget(self, action: #selector(DSHomeController.profileClick), for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }()
    
    lazy var viewModel = DSMovieViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        loadHomeData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DSHomeController{
    fileprivate func loadHomeData(){
        viewModel.loadHomeData(success: { [weak self] in
            
        }) { (msg) in
            
        }
    }
}

extension DSHomeController{
    @objc private func profileClick(){
        print(123)
        navigationController?.pushViewController(DSProfileController(), animated: true)
    }
}

extension DSHomeController{
    private func setUI() {
        navigationItem.leftBarButtonItem = profileItem
        navigationItem.title = "港澳通"
    }
}
