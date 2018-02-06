//
//	DSList.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import RealmSwift


class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}


class DSListModel : Object{

    
    
    @objc dynamic var img : String!
    @objc dynamic var isShow : Bool = true
    @objc dynamic var m3u8 : String!
    @objc dynamic var name : String!
    @objc dynamic var typeName : String!
    @objc dynamic var isSelected:Bool = false
    @objc dynamic var date:String?

    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    class func fromDictionary(dictionary: [String:Any]) -> DSListModel    {
        let this = DSListModel()
        if let imgValue = dictionary["img"] as? String{
            this.img = imgValue
        }
        if let isShowValue = dictionary["isShow"] as? Bool{
            this.isShow = isShowValue
        }
        if let m3u8Value = dictionary["m3u8"] as? String{
            this.m3u8 = m3u8Value
        }
        if let nameValue = dictionary["name"] as? String{
            this.name = nameValue
        }
        if let typeNameValue = dictionary["typeName"] as? String{
            this.typeName = typeNameValue
        }
        return this
    }
    


    
    
    
}
