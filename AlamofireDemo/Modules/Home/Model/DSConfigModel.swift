//
//	DSConfig.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSConfigModel : NSObject{

	var ad : DSAdModel!
	var admob : DSAdmobModel!
	var alert : DSAlertModel!
	var banner : [DSBannerModel]!
	var kds : DSKdsModel!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let adData = dictionary["ad"] as? [String:Any]{
			ad = DSAdModel(fromDictionary: adData)
		}
		if let admobData = dictionary["admob"] as? [String:Any]{
			admob = DSAdmobModel(fromDictionary: admobData)
		}
		if let alertData = dictionary["alert"] as? [String:Any]{
			alert = DSAlertModel(fromDictionary: alertData)
		}
		banner = [DSBannerModel]()
		if let bannerArray = dictionary["banner"] as? [[String:Any]]{
			for dic in bannerArray{
				let value = DSBannerModel(fromDictionary: dic)
				banner.append(value)
			}
		}
		if let kdsData = dictionary["kds"] as? [String:Any]{
			kds = DSKdsModel(fromDictionary: kdsData)
		}
	}

}
