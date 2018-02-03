//
//  DSHomeController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SDCycleScrollView
import MBProgressHUD

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
        //cycleView.placeholderImage = #imageLiteral(resourceName: "back")
        cycleView.delegate = self
        cycleView.backgroundColor = DSConfig.viewBackgroundColor
        
        cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        return cycleView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.tableHeaderView = banerView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
        let nib = UINib(nibName: DSHomeCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DSHomeCell.className)
        tableView.backgroundColor = DSConfig.viewBackgroundColor
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

extension DSHomeController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homeModel?.data.category.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DSHomeCell.className) as! DSHomeCell
        cell.backgroundColor = UIColor.random
        cell.model = viewModel.homeModel?.data.category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
            let titles = baners?.map({
                 $0.name
            })

            self?.banerView.imageURLStringsGroup = urls
            self?.banerView.titlesGroup = titles
            self?.tableView.reloadData()
            self?.view.hideLoading("载入成功")
        }) {[weak self] (msg) in
            self?.view.hideLoading(msg)
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
        view.backgroundColor = DSConfig.viewBackgroundColor

        view.addSubview(tableView)
    }
}
