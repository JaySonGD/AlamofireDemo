//
//  DSHomeCell.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import Kingfisher

class DSHomeCell: UITableViewCell {

    @IBOutlet weak var radiuContentView: UIView!
    
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var collectBtn: UIButton!
    @IBOutlet weak var desLB: UILabel!
    @IBOutlet weak var logoIV: UIImageView!
    
    var model: DSMovieModel?{
        didSet{
           print(model?.author)
            nameLB.text = model?.name
            desLB.text = model?.info
            logoIV.kf.
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        radiuContentView.layerCornerRadius(radiu: 10.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
