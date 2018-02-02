//
//  DSHomeController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SDCycleScrollView

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
    
    
    lazy var banerView: SDCycleScrollView = {
        let cycleView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 200))
        cycleView.placeholderImage = #imageLiteral(resourceName: "back")
        cycleView.delegate = self
        return cycleView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.tableHeaderView = banerView
        return tableView
    }()
    
    
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

extension DSHomeController:SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
}

extension DSHomeController{
    fileprivate func loadHomeData(){
        view.showLoading()
        viewModel.loadHomeData(success: { [weak self] in
            
            let homeModel =  self?.viewModel.homeModel
            let baners = homeModel?.data.banner
            let urls = baners?.map({
                URL(string: $0.bimg)
            })
            self?.banerView.imageURLStringsGroup = urls
            self?.view.removeLoading()
            
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
        
        view.addSubview(tableView)
    }
}
