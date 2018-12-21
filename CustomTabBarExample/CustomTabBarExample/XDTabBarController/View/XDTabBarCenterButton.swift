//
//  XDTabBarCenterButton.swift
//  XDTabBarController
//
//  Created by 孙晓栋 on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
import SnapKit
class XDTabBarCenterButton: UIButton {
    /**
     跳转的类型，1录播2电台
     */
    var type = 0
    //专辑图
   fileprivate let coverImage = UIImageView.init(frame: CGRect.init(x: 5, y: 5, width: 50, height: 50))
    //播放icon
    let playIcon = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 21, height: 24))
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = frame.width/2
        self.layer.masksToBounds = true
        self.adjustsImageWhenHighlighted = false//去除点击效果
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
