//
//  DSCollectController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/6.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import LYEmptyView

class DSCollectController: DSBaseController {

    lazy var viewModel: DSMovieViewModel = {
        let vm = DSMovieViewModel()
        vm.loadCollectModes()
        return vm
    }()
    
    
    // MARK: - <懒加载>
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
        let nib = UINib(nibName: DSHomeCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DSHomeCell.className)
        tableView.backgroundColor = DSConfig.viewBackgroundColor
        
        let emptyView = LYEmptyView.emptyActionView(withImageStr: "back", titleStr: "暂无更多数据", detailStr: "", btnTitleStr: "我要收藏", btnClick: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        })
        
        tableView.ly_emptyView = emptyView
        emptyView?.actionBtnBackGroundColor = DSConfig.barTintColor;
        emptyView?.actionBtnTitleColor = UIColor.white;
        tableView.ly_emptyView.isHidden = true
        
        return tableView
    }()

    // MARK: - <生命周期>
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - <自定义方法>
extension DSCollectController{
    func setUI()  {
        navigationItem.title = "收藏"
        view.addSubview(tableView)
    }
    
}

extension DSCollectController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.collectModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DSHomeCell.className) as! DSHomeCell
        //cell.backgroundColor = UIColor.random
        cell.model = viewModel.collectModels?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

