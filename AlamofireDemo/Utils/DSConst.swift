//
//  DSAppMacro.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit

//delegate 代理
let DSAppDelegate = UIApplication.shared.delegate as! AppDelegate

// 沙盒文档路径
let kSandDocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!

/// 屏幕的宽度
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let kScreenHeight = UIScreen.main.bounds.height


/// 服务器地址
//let BASE_URL = "http://lf.snssdk.com"
//let BASE_URL = "http://ib.snssdk.com"
let BASE_URL = "https://is.snssdk.com"

let isIPhoneX: Bool = kScreenHeight == 812 ? true : false


let device_id: Int = 6096495334
let iid: Int = 5034850950
