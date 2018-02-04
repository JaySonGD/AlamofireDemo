//
//	DSAd.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSAdModel : NSObject{

	var adScale : Float!
	var enabled : Bool!
	var launchAd : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		adScale = dictionary["adScale"] as? Float
		enabled = dictionary["enabled"] as? Bool
		launchAd = dictionary["launchAd"] as? Bool
	}

}
