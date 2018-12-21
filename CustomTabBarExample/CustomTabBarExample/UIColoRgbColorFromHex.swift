//
//  UIColorrgbColorFromHex.swift
//  BoardCast-swift
//
//  Created by admin on 2017/8/21.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
        /**
         Make color with hex string
        - parameter hex: 16进制字符串
        - returns: RGB
        */
      static func colorWithHexString (hex: String) -> UIColor {
                 var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()

                 if (cString.hasPrefix("#")) {
                         cString = (cString as NSString).substring(from: 1)
                     }

                 if (cString.count != 6) {
                         return UIColor.gray
                     }

                 let rString = (cString as NSString).substring(to: 2)
                 let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
                 let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
                 var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
                 Scanner(string: rString).scanHexInt32(&r)
                 Scanner(string: gString).scanHexInt32(&g)
                 Scanner(string: bString).scanHexInt32(&b)

                 return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
             }
     }
