//
//  DS91PlayModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/8.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DS91PlayModel: NSObject {

    var allURLs : [String]!
    var programLists : [String]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        allURLs = dictionary["allURLs"] as? [String]
        programLists = dictionary["programLists"] as? [String]
    }

}
