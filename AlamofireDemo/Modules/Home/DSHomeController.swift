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
import LYEmptyView
import RealmSwift

class DSHomeController: DSBaseController {
    
    // MARK: - <懒加载>
    lazy var viewModel = DSMovieViewModel()

    lazy var player: UIBarButtonItem = {
        let player = UIBarButtonItem(image: #imageLiteral(resourceName: "player"), style: .plain, target: self, action: #selector(DSHomeController.playerClick))
        return player
    }()
    
    lazy var profileItem :UIBarButtonItem = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "back"), for: .highlighted)
        btn.size = CGSize(width: 22, height: 44)
        btn.addTarget(self, action: #selector(DSHomeController.profileClick), for: .touchUpInside)
      
        return UIBarButtonItem(customView: btn)
    }()
    
    
    
    lazy var banerView: SDCycleScrollView = {
        let bh = 6.0 * kScreenWidth / 16.0
        let cycleView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: bh))
        //cycleView.placeholderImage = #imageLiteral(resourceName: "back")
        cycleView.delegate = self
        cycleView.backgroundColor = DSConfig.viewBackgroundColor
        
        cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        return cycleView
    }()
    
    lazy var cateView: UICollectionView = {
        let ch = (kScreenWidth - 50) * 0.25
        let bh = 6.0 * kScreenWidth / 16.0

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: ch, height: ch)
        //layout.minimumLineSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: bh+10, width: kScreenWidth, height: ch), collectionViewLayout: layout)
        

        collectionView.register(UINib(nibName: DSCategoryCell.className, bundle: nil), forCellWithReuseIdentifier: DSCategoryCell.className)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = DSConfig.viewBackgroundColor

        return collectionView
    }()
    
    lazy var headerView: UIView = {
        
        let bh = 6.0 * kScreenWidth / 16.0
        let ch = (kScreenWidth - 50) * 0.25
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: bh + ch + 10))
        headerView.backgroundColor = DSConfig.viewBackgroundColor
        headerView.addSubview(self.banerView)
        headerView.addSubview(self.cateView)
        headerView.clipsToBounds = true
        return headerView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.y = NavbarHeight
        tableView.height = kScreenHeight - NavbarHeight //- SafeAreaBottomHeight
        tableView.tableHeaderView = headerView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
        let nib = UINib(nibName: DSHomeCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DSHomeCell.className)
        tableView.backgroundColor = DSConfig.viewBackgroundColor
        tableView.contentInset = UIEdgeInsetsMake(0, 0, SafeAreaBottomHeight, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
//        tableView.separatorInset = UIEdgeInsetsMake(0, 0, SafeAreaBottomHeight, 0)

        
        let emptyView = LYEmptyView.emptyActionView(withImageStr: "back", titleStr: "暂无更多数据", detailStr: "", btnTitleStr: "重新加载", btnClick: {[weak self] in
            self?.loadHomeData()
        })
        
        tableView.ly_emptyView = emptyView
        emptyView?.actionBtnBackGroundColor = DSConfig.barTintColor;
        emptyView?.actionBtnTitleColor = UIColor.white;
        //tableView.ly_emptyView.isHidden = true

        return tableView
    }()
    
    
    // MARK: - <生命周期>
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        loadHomeData() 
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //tableView.height = kScreenHeight - NavbarHeight
        tableView.y = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// MARK: - <UICollectionViewDataSource>
extension DSHomeController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.homeModel?.config.category.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DSCategoryCell.className, for: indexPath) as! DSCategoryCell
        cell.model = viewModel.homeModel?.config.category[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.homeModel?.config.category[indexPath.item]
        self.openURL(str: model?.url,type: .push)
    }
}
// MARK: - <UITableViewDelegate>

extension DSHomeController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homeModel?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DSHomeCell.className) as! DSHomeCell
        //cell.backgroundColor = UIColor.random
        cell.model = viewModel.homeModel?.list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let newModel = (viewModel.homeModel?.list[indexPath.row]) else { return }
        DSPlayer.share.play(model: newModel)
   
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        newModel.date = fmt.string(from: Date())
            
        let realm = try! Realm()
        try! realm.write {
                let dict = newModel.toDictionary()
                let historyModel = DSListModel.fromDictionary(dictionary: dict)
                realm.add(historyModel, update: true)
        }
    }
}
// MARK: - <SDCycleScrollViewDelegate>
extension DSHomeController:SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
}
// MARK: - <网络请求>
extension DSHomeController{
    fileprivate func loadHomeData(){
        view.showLoading()
        viewModel.loadHomeData(success: { [weak self] in
            
            

            
            let homeModel =  self?.viewModel.homeModel
            let baners = homeModel?.config.banner
            let urls = baners?.map({
                URL(string: $0.url)
            })
            let titles = baners?.map({
                 $0.title
            })
            let bh = 6.0 * kScreenWidth / 16.0

            (homeModel?.config.category.count != 0) ? () : (self?.headerView.height = bh)
            self?.view.addSubview((self?.tableView)!)

            self?.banerView.imageURLStringsGroup = urls
            self?.banerView.titlesGroup = titles
            self?.tableView.reloadData()
            self?.view.hideLoading("载入成功")
            self?.tableView.ly_endLoading()
            //(homeModel?.list.count != 0) ? () : (self?.tableView.ly_emptyView.isHidden = false)

        }) {[weak self] (msg) in
            self?.view.hideLoading(msg)
            self?.tableView.ly_emptyView.titleStr = msg
            //self?.tableView.ly_emptyView.isHidden = false
        }
    }
}
// MARK: - <事件处理>
extension DSHomeController{
    @objc private func playerClick(){
        navigationController?.pushViewController(DSPlayerController(), animated: true)
    }
    
    @objc private func profileClick(){
        print(123)
        navigationController?.pushViewController(DSProfileController(), animated: true)
    }
}
// MARK: - <自定义方法>
extension DSHomeController{
    private func setUI() {
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }

        navigationItem.leftBarButtonItem = profileItem
        navigationItem.title = "港澳通"
        view.backgroundColor = DSConfig.viewBackgroundColor
        navigationItem.rightBarButtonItem = player
        
//        noMoreDataImage = "back"
//        noMoreDataTitle = "暂无更多数据"
//        noMoreDataActionTitle = "重新加载"
//        noMoreDataAction = {[weak self] in
//            self?.loadHomeData()
//        }
//
//        initTableView(dataSource: self,
//                      delegate: self,
//                      rowHeight: 130,
//                      cellClass: DSHomeCell.self)
//        tableView.tableHeaderView = headerView
//        tableView.y = NavbarHeight
//        tableView.height = kScreenHeight - NavbarHeight - SafeAreaBottomHeight

    }
}
