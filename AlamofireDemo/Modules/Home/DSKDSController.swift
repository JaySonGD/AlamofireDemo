//
//  DSKDSController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/8.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSKDSController: DSBaseController {

    lazy var viewModel = DSMovieViewModel()
    
    var link : Int = 0
    var url : String = ""
    
    
    lazy var cateView: UICollectionView = {
        let ch = (kScreenWidth - 40) / 3.0
        let bh = 6.0 * kScreenWidth / 16.0
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: ch, height: ch)
        //layout.minimumLineSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), collectionViewLayout: layout)
        
        
        collectionView.register(UINib(nibName: DSCategoryCell.className, bundle: nil), forCellWithReuseIdentifier: DSCategoryCell.className)
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = DSConfig.viewBackgroundColor
        
        return collectionView
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - <UICollectionViewDataSource>
extension DSKDSController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if link == 0 {
            return viewModel.provinceModels?.count ?? 0
        }else{
            return viewModel.cityModels?.count ?? 0
        }
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DSCategoryCell.className, for: indexPath) as! DSCategoryCell
        if link == 0 {
            cell.dsModel = viewModel.provinceModels?[indexPath.item]
        }else{
            cell.dsModel = viewModel.cityModels?[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if link == 0 {
            let vc = DSKDSController()
            vc.link = 1
            vc.url = viewModel.provinceModels![indexPath.item].provinceUrl
            navigationController?.pushViewController(vc, animated: true)

        }else{
            
            let cmodel = viewModel.cityModels![indexPath.item]
            view.showLoading()
            viewModel.loadPlay(cityURL: cmodel.provinceUrl,
                               success: { [weak self](model) in
                                self?.view.hideLoading("")
                                let vc = DSPlayViewController()
                                //vc.model = model
                                //vc.title = cmodel.province
                                self?.navigationController?.pushViewController(vc, animated: true)

            })
            

        }
        
    }
}
// MARK: - <自定义方法>
extension DSKDSController{
    private func setUI() {
        //navigationItem.title = "港澳通"
        view.backgroundColor = DSConfig.viewBackgroundColor
        view.addSubview(cateView)
        view.showLoading()
        
        if link == 0 {
            viewModel.loadProvince {[weak self] in
                self?.view.hideLoading("")
                self?.cateView.reloadData()
            }
        }else {
            
            viewModel.loadCity(cityURL: url, success: {[weak self] in
                self?.view.hideLoading("")
                self?.cateView.reloadData()
            })

        }
        
        
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

