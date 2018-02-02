//
//  DSDataModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSDataModel: NSObject {
    var api : String!
    var banner : [DSMovieModel]!
    var category : [DSMovieModel]!
    var jsCode : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        api = dictionary["api"] as? String
        banner = [DSMovieModel]()
        if let bannerArray = dictionary["banner"] as? [[String:Any]]{
            for dic in bannerArray{
                let value = DSMovieModel(fromDictionary: dic)
                banner.append(value)
            }
        }
        category = [DSMovieModel]()
        if let categoryArray = dictionary["category"] as? [[String:Any]]{
            let categoryDict = categoryArray.first as? [String:Any]
            let dataArray = categoryDict!["data"] as? [[String:Any]]
            for dic in dataArray!{
                let value = DSMovieModel(fromDictionary: dic)
                category.append(value)
            }
        }
        jsCode = dictionary["jsCode"] as? String
    }

}
