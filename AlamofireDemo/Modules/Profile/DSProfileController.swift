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
    
    lazy var bgImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "bg")
        return imageView
    }()
    
    lazy var headView : UIView = {
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHeadViewHeight))
        headView.y = -NavbarHeight
        headView.backgroundColor = UIColor.random
        headView.addSubview(bgImageView)
        
        let sw = UISwitch()
        sw.centerX = kScreenWidth * 0.5
        sw.centerY = 100
        headView.addSubview(sw)
        return headView
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
        navigationController?.navigationBar.barTintColor = DSConfig.barTintColor // title
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
            let totalOffset = 200 + abs(yOffset)
            let f = totalOffset / 200
            bgImageView.frame = CGRect(x: -(kScreenWidth * f - kScreenWidth) / 2, y: yOffset, width: kScreenWidth * f, height: totalOffset)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 32;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundColor = UIColor.random
        return cell!
    }
}

extension DSProfileController{
    private func setUI() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
}
