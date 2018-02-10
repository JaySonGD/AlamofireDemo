//
//  DSMovieViewModel.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/1.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift
//import TFHpple


class DSMovieViewModel: NSObject {

    var homeModel : DSHomeModel?
    var collectModels : [DSListModel]?
    var historyModels : [DSListModel]?
    
    var provinceModels : [DS91KDSModel]?
    var cityModels : [DS91KDSModel]?
//    var playModels : DS91PlayModel?


//    func getHtml()  {
//
//
//        Alamofire.request("http://www.metvb.com/").responseString(queue: DispatchQueue.main, encoding: String.Encoding.utf8) { (OBJ) in
//
//            if let html = OBJ.value {
//
//               let data =  html.data(using: String.Encoding.utf8)
//
//               let tfh = TFHpple(htmlData: data)
//                let lis:[TFHppleElement] = tfh?.search(withXPathQuery: "//li") as! [TFHppleElement]
//
//                for li in lis{
//
//                    let a : TFHppleElement = li.children.last as! TFHppleElement
//                    let title = a.object(forKey: "title")
//                    print(title)
//
//                    let div = a.children
//
//                    //let img = (((a.children.first as! TFHppleElement).children.first)as! TFHppleElement).object(forKey: "data-original")
//                    print(div)
//
//
//
//                }
//
//                return;
//            }
//
//        }
//
//    }
    
}

extension DSMovieViewModel{
    
    
    func getM3u8(url:String,
                 success:@escaping (String)->(),
                 failure:@escaping (_ error:String)->()) {
        DSKT.getPayURL(withBaseURL: url, success: { (m3u8) in
            
            guard (m3u8 != nil) else {
                DispatchQueue.main.async {
                    (failure == nil) ? (): failure("无法获取连接")
                }

                return
            }
            
            DispatchQueue.main.async {
                (success == nil) ? (): success(m3u8!)
            }

        }) { (error) in
            let e = error! as NSError
            DispatchQueue.main.async {
                (failure == nil) ? (): failure(e.localizedFailureReason!)
            }

        }
    }
    
    func loadPlay(cityURL:String ,success:@escaping (DS91PlayModel)->())  {
        DSKT.getOneChannelKDSModel(withUrl: cityURL) { (obj) in
            guard let dic:[String:Any] = obj as? [String : Any] else {
                return
            }
            
            DispatchQueue.main.async {
                (success == nil) ? (): success(DS91PlayModel(fromDictionary: dic))
            }

        }
    }
    
    
    func loadCity(cityURL:String ,success:@escaping ()->()) {

        
        DSKT.getOneProvinceAllKDSModel(withUrl: cityURL) {[weak self] (obj) in
            
            guard let array:[[String:Any]] = obj as? [[String : Any]] else {
                return
            }
            
            var models:[DS91KDSModel] = []
            for dic in array{
                models.append(DS91KDSModel(fromDictionary: dic))
            }
            
            self?.cityModels = models
            DispatchQueue.main.async {
                (success == nil) ? (): success()
            }

        }
        
    }

    
    func loadProvince(success:@escaping ()->()) {
        DSKT.getAll91_KDSModelSucess { [weak self] (obj) in
            
            
            
            
            guard let array:[[String:Any]] = obj as? [[String : Any]] else {
                return
            }
            
            var models:[DS91KDSModel] = []
            for dic in array{
                models.append(DS91KDSModel(fromDictionary: dic))
            }
            
            self?.provinceModels = models
            DispatchQueue.main.async {
                (success == nil) ? (): success()
            }

        }

    }
    
}


extension DSMovieViewModel{
    func loadCollectModes(isCollected:Bool = true) {
        let rel = try! Realm()

        
        let lists  = rel.objects(DSListModel.self).filter("isSelected = %d",isCollected)
        
        var array : [DSListModel] = []
        
        for list in lists.enumerated() {
            array.append(list.element)
        }
        isCollected ?  (collectModels = array) : (historyModels = array)
        
        print(lists)

    }
}

extension DSMovieViewModel{
    func loadHomeData(success:@escaping ()->(),
                      failure:@escaping (_ error:String)->()) {
        
        DSHttpManager.share.request(url: "http://oz4rov2id.bkt.clouddn.com/index.json",
                                    parameters: ["c":"movie","a":"home","debug":9],
                                    success: {[weak self] (obj) in
                                        
                                        let json = JSON(obj)
                                        self?.homeModel = DSHomeModel(fromDictionary: json.dictionaryObject!)
                                        (success == nil) ? (): success()
                                        print(obj)
        }) { (error) in
            let e = error as NSError
            (failure == nil) ? (): failure(e.localizedFailureReason!)
            print(error)
        }
    }

}
