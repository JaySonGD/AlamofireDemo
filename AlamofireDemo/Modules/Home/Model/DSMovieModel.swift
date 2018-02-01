//
//  DSMovieModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

class DSMovieModel: NSObject {
    
    var author : String!
    var banner : String!
    var bimg : String!
    var category : String!
    var country : String!
    var director : String!
    var id : String!
    var info : String!
    var logo : String!
    var mdate : String!
    var mtime : String!
    var name : String!
    var score : String!
    var see : String!
    var style : String!
    var url : String!
    
    
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
