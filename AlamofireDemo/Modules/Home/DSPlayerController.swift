//
//  DSPlayerController.swift
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class DSPlayerController: DSBaseController {
    
    // MARK: - <属性>
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var bgIV: UIImageView!
    
    
    var model : DSListModel?{
        didSet{
            guard let newModel = model else { return  }
            
            navigationItem.title = newModel.name
            logoIV.kf.setImage(with: URL(string: newModel.img), placeholder: #imageLiteral(resourceName: "bg"), options: nil, progressBlock: nil, completionHandler: nil)
            collectBtn.isSelected = newModel.isSelected
            imageViewRevolve()
            
//            if newModel.isSelected == false {// 历史记录
//                
//                let fmt = DateFormatter()
//                fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
//                newModel.date = fmt.string(from: Date())
//                
//                let realm = try! Realm()
//                try! realm.write {
//                    let dict = newModel.toDictionary()
//                    let historyModel = DSListModel.fromDictionary(dictionary: dict)
//                    realm.add(historyModel, update: true)
//                }
//                
//            }
            
        }
    }
    
    
    // MARK: - <懒加载>
    lazy var collectBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(#imageLiteral(resourceName: "clloect"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "clloect_select"), for: .selected)
        btn.backgroundColor = UIColor.random
        btn.size = CGSize(width: 44, height: 44)
        btn.clickEventHandler({[weak self] (sender:UIButton?) in
            
            guard (self?.model != nil) else {
                
                self?.view.hideLoading("无法收藏")
                return
            }
            self?.model?.isSelected = !(self?.model?.isSelected)!
            
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            self?.model?.date = fmt.string(from: Date())
            
            let realm = try! Realm()
            try! realm.write {
                let dict = self?.model?.toDictionary()
                
                let clloectModel = DSListModel.fromDictionary(dictionary: dict!)
                realm.add(clloectModel, update: true)
                if !(clloectModel.isSelected) {
                    realm.delete(clloectModel)
                }
            }

            return ()
        }, for: .touchUpInside)
        return btn
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        DSPlayer.share.isPlaying ? (bgIV.layer.resumeAnimate()) : (bgIV.layer.pauseAnimate())
        playBtn.isSelected = DSPlayer.share.isPlaying
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(DSConfig.barTintColor.image, for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoIV.layerCornerRadius(radiu: logoIV.width * 0.5)
    }
    


    // MARK: - <事件处理>
    @IBAction func backClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func playClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

        if sender.isSelected {
          bgIV.layer.pauseAnimate()
          DSPlayer.share.play()

        }else{
          bgIV.layer.resumeAnimate()
            DSPlayer.share.pause()

        }
    }
    
}



// MARK: - <自定义方法>
extension DSPlayerController{
    private func setUI(){
        let bar = UIToolbar(frame: UIScreen.main.bounds)
        bar.barStyle = .black
        bar.alpha = 0.9

        bgIV.addSubview(bar)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: collectBtn)
        
        
        model = DSPlayer.share.currenttModel

    }
    
    private func imageViewRevolve() {
        
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = 0
        //anim.toValue = M_PI * 2
        anim.toValue = Double.pi * 2
        anim.duration = 10
        anim.repeatCount = Float(NSIntegerMax)
        anim.isRemovedOnCompletion = false
        self.logoIV.layer.add(anim, forKey: nil)
        
    }


}
