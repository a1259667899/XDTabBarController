//
//  UIFont+Extension.swift
//  BoardCast
//
//  Created by admin on 2018/6/22.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

extension UIFont {
    /// Create a UIFont object with a `Font` enum
    public convenience init?(font: XDFont, size: CGFloat) {
        let fontIdentifier: String = font.rawValue
        self.init(name: fontIdentifier, size: size)
    }
    /**
     获取系统字体
     */
    class func getSysFonts(){
        var familyNameArray:[String] = []
        let familyNamesAll = UIFont.familyNames
        for family in familyNamesAll {
            debugPrint("============================")
            let fonts = UIFont.fontNames(forFamilyName: family)
            for font in fonts{
                debugPrint(font)
                familyNameArray.append(font)
            }
        }
    }
}
