//
//  DSPlayerController.swift
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import RealmSwift

class DSPlayerController: DSBaseController {
    
    // MARK: - <属性>
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var bgIV: UIImageView!
    
    
    var model : DSListModel?{
        didSet{
            print(model)
            print(oldValue)
            DSPlayer.share.play(model: model!)
            imageViewRevolve()
        }
    }
    
    
    // MARK: - <懒加载>
    lazy var collectItem: UIBarButtonItem = {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(#imageLiteral(resourceName: "clloect"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "clloect_select"), for: .selected)
        btn.clickEventHandler({ (sender:UIButton?) in
            sender?.isSelected = !btn.isSelected
            return ()
        }, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
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
        sender.isSelected  ?  (bgIV.layer.pauseAnimate()) : (bgIV.layer.resumeAnimate())

        let rel = try! Realm()
        let lists  = rel.objects(DSListModel.self)

        print(lists)
    }
    
}



// MARK: - <自定义方法>
extension DSPlayerController{
    private func setUI(){
        let bar = UIToolbar(frame: UIScreen.main.bounds)
        bar.barStyle = .black
        bgIV.addSubview(bar)
        navigationItem.rightBarButtonItem = collectItem
        navigationItem.title = "rr"
        

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
