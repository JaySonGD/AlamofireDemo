//
//  DSBaseController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import Alamofire
import LYEmptyView

class DSBaseController: UIViewController {

    
//    var noMoreDataAction : (()->())?
//    var noMoreDataImage : String = "back"
//    var noMoreDataTitle : String = "暂无更多数据"
//    var noMoreDataActionTitle : String = "重新加载"
//
//    // MARK: - <懒加载>
//    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
//        //tableView.dataSource = self
//        //tableView.delegate = self
//        //tableView. = 130
//        //tableView.separatorStyle = .none
//        //let nib = UINib(nibName: DSHomeCell.className, bundle: nil)
//        //tableView.register(nib, forCellReuseIdentifier: DSHomeCell.className)
//        tableView.backgroundColor = DSConfig.viewBackgroundColor
//        
//        let emptyView = LYEmptyView.emptyActionView(withImageStr: noMoreDataImage, titleStr: noMoreDataTitle, detailStr: "", btnTitleStr: noMoreDataActionTitle, btnClick: {[weak self] in
//            (self?.noMoreDataAction == nil) ? () : self?.noMoreDataAction!()
//        })
//        
//        tableView.ly_emptyView = emptyView
//        emptyView?.actionBtnBackGroundColor = DSConfig.barTintColor;
//        emptyView?.actionBtnTitleColor = UIColor.white;
//        tableView.ly_emptyView.isHidden = true
//        
//        return tableView
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DSConfig.viewBackgroundColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return  .lightContent
    }
}

extension DSBaseController{
//    func initTableView(dataSource:UITableViewDataSource,
//                       delegate:UITableViewDelegate? = nil,
//                       rowHeight:CGFloat = 44,
//                       formNiB:Bool = true,
//                       separatorStyle : UITableViewCellSeparatorStyle = .none,
//                       showsVerticalScrollIndicator:Bool = true,
//                       cellClass:UITableViewCell.Type)  {
//
//        tableView.dataSource = dataSource
//        tableView.delegate = delegate
//        tableView.separatorStyle = separatorStyle
//        tableView.rowHeight = rowHeight
//        tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
//
//        (rowHeight != UITableViewAutomaticDimension) ? () : (tableView.estimatedRowHeight = 100)
//
//        if formNiB {
//            let nib = UINib(nibName: cellClass.className, bundle: nil)
//            tableView.register(nib, forCellReuseIdentifier: cellClass.className)
//        }else{
//            tableView.register(cellClass, forCellReuseIdentifier: cellClass.className)
//        }
//
//        view.addSubview(tableView)
//    }
}
