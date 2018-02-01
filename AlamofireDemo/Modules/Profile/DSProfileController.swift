//
//  DSProfileController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSProfileController: DSBaseController {
    
    let kHeadViewHeight : CGFloat = 300
    
    lazy var datas: [[[String:Any]]] = {
        
        let array = [
            [
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
            ],
            [
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
            ],
            [
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
                ["title":"我的","image":#imageLiteral(resourceName: "clloect_select")],
                ],
            ]
        
        return array
    }()
    
    lazy var bgImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "bg")
        return imageView
    }()
    
    lazy var headButtomView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: kHeadViewHeight - 64, width: kScreenWidth, height: 64))
        view.backgroundColor = UIColor.white
        
        let clloectBtn = DSButton(type: UIButtonType.custom)
        clloectBtn.setImage(#imageLiteral(resourceName: "clloect"), for: .normal)
        clloectBtn.setImage(#imageLiteral(resourceName: "clloect_select"), for: .selected)
        clloectBtn.setTitle("收藏", for: .normal)
        clloectBtn.addTarget(self, action: #selector(DSProfileController.clloectClick(btn:)), for: .touchUpInside)
        view.addSubview(clloectBtn)
        
        let historyBtn = DSButton(type: UIButtonType.custom)
        historyBtn.setImage(#imageLiteral(resourceName: "history"), for: .normal)
        historyBtn.setTitle("历史", for: .normal)
        view.addSubview(historyBtn)
        

        clloectBtn.snp.makeConstraints { (make) -> Void in
            make.left.bottom.top.equalTo(view)
            make.right.equalTo(historyBtn.snp.left)

        }
        
        historyBtn.snp.makeConstraints { (make) -> Void in
            make.right.bottom.top.equalTo(view)
            make.width.equalTo(clloectBtn.snp.width)
        }


        
        return view
    }()
    
    lazy var headView : UIView = {
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight))
        headView.y = -NavbarHeight
        headView.backgroundColor = UIColor.random
        headView.addSubview(bgImageView)
        headView.addSubview(headButtomView)
        
        let sw = UISwitch()
        sw.centerX = kScreenWidth * 0.5
        sw.centerY = 100
        headView.addSubview(sw)
        return headView
    }()
    
    lazy var footerLabel: UILabel = {
        let label = UILabel()
        let infoDict = Bundle.main.infoDictionary
        let version = infoDict!["CFBundleShortVersionString"] as! String
        let bulid = infoDict!["CFBundleVersion"] as! String
        label.height = 84
        label.text = "版本号：\(version) (BULID \(bulid))"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.y = -NavbarHeight
        tableView.height = kScreenHeight + NavbarHeight
        tableView.tableHeaderView = headView
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = footerLabel
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(DSConfig.barTintColor.image, for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
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

extension DSProfileController:UITableViewDataSource,UITableViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y  // 偏移的y值
        if yOffset < 0 {
            let totalOffset = kHeadViewHeight + abs(yOffset)
            let f = totalOffset / kHeadViewHeight
            bgImageView.frame = CGRect(x: -(kScreenWidth * f - kScreenWidth) / 2.0, y: yOffset, width: kScreenWidth * f, height: totalOffset)
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator
        let dict = datas[indexPath.section][indexPath.row]
        cell?.textLabel?.text = dict["title"] as? String
        cell?.imageView?.image = dict["image"] as? UIImage
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = DSConfig.viewBackgroundColor
        return view
    }
}

extension DSProfileController{
    @objc private func clloectClick(btn:UIButton){
        btn.isSelected = !btn.isSelected
    }
}

extension DSProfileController{
    private func setUI() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
}
