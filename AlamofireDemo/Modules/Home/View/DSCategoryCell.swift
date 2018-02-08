//
//  DSCategoryCell.swift
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSCategoryCell: UICollectionViewCell {
    @IBOutlet weak var imageIV: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    

    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    
    var model: DSCategoryModel?{
        didSet{
            titleLB.text = model?.title
            imageIV.kf.setImage(with: URL(string: (model?.image)!))
        }
    }
    
    var dsModel: DS91KDSModel?{
        didSet{
            
            let str = dsModel?.province as! NSString
             
            titleLB.text = str.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            

            //imageIV.kf.setImage(with: URL(string: (model?.image)!))
            let count = str.length
            (count <= 6) ? (titleHeight.constant = 15) : (titleHeight.constant = 29)
            print(dsModel?.province)
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layerCornerRadius(radiu: 10.0)
        imageIV.layerCornerRadius(radiu: 6.0)
        //titleLB.font = UIFont.systemFont(ofSize: 8)

    }

}
