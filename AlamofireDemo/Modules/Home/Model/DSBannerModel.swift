//
//	DSBanner.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSBannerModel : NSObject{

	var isPlay : Bool!
	var title : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		isPlay = dictionary["isPlay"] as? Bool
		title = dictionary["title"] as? String
		url = dictionary["url"] as? String
	}

}
