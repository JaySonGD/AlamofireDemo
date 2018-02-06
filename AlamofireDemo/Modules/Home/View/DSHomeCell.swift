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
    
    @IBAction func collectClick(_ sender: UIButton) {
        
        model?.isSelected = !(model?.isSelected)!
        sender.isSelected = (model?.isSelected)!
        
        
        let realm = try! Realm()
        
        try! realm.write {
            let fmt = DateFormatter()
            fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            model?.date = fmt.string(from: Date())
            realm.add(model!)
        }
        
    }
    var model: DSListModel?{
        didSet{
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
