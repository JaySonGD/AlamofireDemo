//
//  DSMovieViewModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SwiftyJSON

class DSMovieViewModel: NSObject {

    var model : DSHomeModel?
    
    func loadHomeData(success:@escaping ()->(),
                      failure:@escaping (_ error:String)->()) {
        DSHttpManager.share.request(url: "http://api.ishare.bthost.top/",
                                    parameters: ["c":"movie","a":"home","debug":9],
                                    success: {[weak self] (obj) in
                                        
                                        let json = JSON(obj)
                                        self?.model = DSHomeModel(fromDictionary: json.dictionaryObject!)
                                        
                                        print(obj)
                                    }) { (error) in
                                        print(error)
                                    }
    }
    
    
}
