//
//	DSHome.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSHomeModel : NSObject{

	var config : DSConfigModel!
	var list : [DSListModel]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let configData = dictionary["config"] as? [String:Any]{
			config = DSConfigModel(fromDictionary: configData)
		}
		list = [DSListModel]()
		if let listArray = dictionary["list"] as? [[String:Any]]{
			for dic in listArray{
				let value = DSListModel.fromDictionary(dictionary: dic)
				list.append(value)
			}
		}
	}

}
