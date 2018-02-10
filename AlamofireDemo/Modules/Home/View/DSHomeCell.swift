//
//  DSHomeCell.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class DSHomeCell: UITableViewCell {

    @IBOutlet weak var radiuContentView: UIView!
    
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var collectBtn: UIButton!
    @IBOutlet weak var desLB: UILabel!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var historyLB: UIButton!
    
    @IBAction func collectClick(_ sender: UIButton) {
        
        
        model?.isSelected = !(model?.isSelected)!
        sender.isSelected = (model?.isSelected)!
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        model?.date = fmt.string(from: Date())


        let realm = try! Realm()
        try! realm.write {
            let dict = model?.toDictionary()
            
            let clloectModel = DSListModel.fromDictionary(dictionary: dict!)
            realm.add(clloectModel, update: true)
            if !(clloectModel.isSelected) {
                realm.delete(clloectModel)
            }
            print(Thread.current)
        }
        
    }
    var model: DSListModel?{
        didSet{
//            if !(model?.isSelected)! {
//                let realm = try! Realm()
//                if let rModel = realm.object(ofType: DSListModel.self, forPrimaryKey: model?.m3u8) {
//                    //model?.isSelected = rModel.isSelected
//                }
//            }
            
            nameLB.text = model?.name
            desLB.text = model?.typeName
            logoIV.kf.setImage(with: URL(string: (model?.img)!))
            collectBtn.isSelected = (model?.isSelected)!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        radiuContentView.layerCornerRadius(radiu: 10.0)
        logoIV.layerCornerRadius(radiu: 6.0)
        historyLB.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
