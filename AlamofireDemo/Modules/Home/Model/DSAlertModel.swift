//
//	DSAlert.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSAlertModel : NSObject{

	var act : [DSActModel]!
	var message : String!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		act = [DSActModel]()
		if let actArray = dictionary["act"] as? [[String:Any]]{
			for dic in actArray{
				let value = DSActModel(fromDictionary: dic)
				act.append(value)
			}
		}
		message = dictionary["message"] as? String
		title = dictionary["title"] as? String
	}

}
