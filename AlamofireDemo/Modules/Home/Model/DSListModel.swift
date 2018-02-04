//
//	DSList.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSListModel : NSObject{

	var img : String!
	var isShow : Bool!
	var m3u8 : String!
	var name : String!
	var typeName : String!
    var isSelected:Bool = false

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		img = dictionary["img"] as? String
		isShow = dictionary["isShow"] as? Bool
		m3u8 = dictionary["m3u8"] as? String
		name = dictionary["name"] as? String
		typeName = dictionary["typeName"] as? String
	}

}
