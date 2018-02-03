//
//  DSMovieModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit


@objcMembers class DSMovieModel: NSObject{
    
    
    dynamic var author: String!
    dynamic var banner: String!
    dynamic var bimg: String!
    dynamic var category: String!
    dynamic var country: String!
    dynamic var director: String!
    dynamic var id: String!
    dynamic var info: String!
    dynamic var logo: String!
    dynamic var mdate: String!
    dynamic var mtime: String!
    dynamic var name: String!
    dynamic var score: String!
    dynamic var see: String!
    dynamic var style: String!
    dynamic var url: String!
    dynamic var isSelected:Bool = false
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        author = dictionary["author"] as? String
        banner = dictionary["banner"] as? String
        bimg = dictionary["bimg"] as? String
        category = dictionary["category"] as? String
        country = dictionary["country"] as? String
        director = dictionary["director"] as? String
        id = dictionary["id"] as? String
        info = dictionary["info"] as? String
        logo = dictionary["logo"] as? String
        mdate = dictionary["mdate"] as? String
        mtime = dictionary["mtime"] as? String
        name = dictionary["name"] as? String
        score = dictionary["score"] as? String
        see = dictionary["see"] as? String
        style = dictionary["style"] as? String
        url = dictionary["url"] as? String
    }
    
    


}
