//
//  DSCategoryModel.swift
//  AlamofireDemo
//
//  Created by czljcb on 2018/2/4.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSCategoryModel: NSObject {
    var image : String!
    var title : String!
    var url : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        image = dictionary["image"] as? String
        title = dictionary["title"] as? String
        url = dictionary["url"] as? String
    }

}
