//
//	DSAdmob.swift
//
//	Create by Jayson on 4/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DSAdmobModel : NSObject{

	var googleMobileAdsAppID : String!
	var googleMobileAdsBannerID : String!
	var googleMobileAdsInterstitialID : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		googleMobileAdsAppID = dictionary["googleMobileAdsAppID"] as? String
		googleMobileAdsBannerID = dictionary["googleMobileAdsBannerID"] as? String
		googleMobileAdsInterstitialID = dictionary["googleMobileAdsInterstitialID"] as? String
	}

}
