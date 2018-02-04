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
    
    var model: DSCategoryModel?{
        didSet{
            titleLB.text = model?.title
            imageIV.kf.setImage(with: URL(string: (model?.image)!))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layerCornerRadius(radiu: 10.0)
        imageIV.layerCornerRadius(radiu: 6.0)

    }

}
