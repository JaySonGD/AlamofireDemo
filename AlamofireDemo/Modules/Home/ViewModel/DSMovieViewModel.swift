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
        
        DSHttpManager.share.request(url: "http://127.0.0.1/index.json",
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
