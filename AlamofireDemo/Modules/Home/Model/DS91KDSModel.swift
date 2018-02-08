//
//  DS91KDSModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/8.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DS91KDSModel: NSObject {

    var provinceUrl : String!
    var province : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        provinceUrl = dictionary["provinceUrl"] as? String
        province = dictionary["province"] as? String
    }

}
