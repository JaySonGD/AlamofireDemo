//
//	DSKd.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSKdsModel : NSObject{

	var kds1 : String!
	var kds2 : String!
	var letvhtml : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		kds1 = dictionary["kds1://"] as? String
		kds2 = dictionary["kds2://"] as? String
		letvhtml = dictionary["letvhtml"] as? String
	}

}
