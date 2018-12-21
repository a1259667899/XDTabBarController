//
//  XDConfig.swift
//  XDTabBarController
//
//  Created by admin on 2017/11/8.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class XDConfig: NSObject {
//根视图控制器 tabBarViewController
    static let rootViewController = UIApplication.shared.keyWindow?.rootViewController as! XDTabBarController
    static let kDeviceWidth = UIScreen.main.bounds.width
    static let kDeviceHeight = UIScreen.main.bounds.height
}
