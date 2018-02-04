//
//  DSHttpManager.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import Alamofire

public enum DSHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
}


class DSHttpManager: NSObject {

    static let share = DSHttpManager()
    fileprivate override init() {}

    
    fileprivate lazy var sessionManager : SessionManager = {
        //配置 , 通常默认即可
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        //设置超时时间为10S
        config.timeoutIntervalForRequest = 5.0
        
        //根据config创建manager
        let manger = SessionManager(configuration: config)
        return manger;
    }()
    
    func request(url:String,
                 parameters:[String:Any]?,
                 method:DSHTTPMethod = .get,
                 success:@escaping (_ obj:Any)->(),
                 failure:@escaping (_ error:Error)->()){

//        var httpType = HTTPMethod.get
//        if method == DSHTTPMethod.post {
//            httpType = HTTPMethod.post
//        }
        
        let httpType = (method == DSHTTPMethod.get) ? HTTPMethod.get : HTTPMethod.post
        
        
        sessionManager.request(url, method: httpType, parameters: parameters).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                failure(response.result.error!)
                return
            }
            if let value = response.result.value {
                success(value)
                return
            }
            
            failure(NSError.init(domain: "数据为空", code: 20001, userInfo: nil))

        }
    }

    
    
    
    
}
