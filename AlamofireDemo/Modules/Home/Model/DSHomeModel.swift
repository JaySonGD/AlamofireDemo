//
//  DSHomeModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSHomeModel: NSObject {
    
    var code : Int!
    var data : DSDataModel!
    var msg : String!
    var ver : String!
    
    init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? Int
        if let dataData = dictionary["data"] as? [String:Any]{
            data = DSDataModel(fromDictionary: dataData)
        }
        msg = dictionary["msg"] as? String
        ver = dictionary["ver"] as? String
    }
}
