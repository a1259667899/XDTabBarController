//
//  XDTabBar.swift
//  XDTabBarController
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
protocol XDTabBarDelegate:UITabBarDelegate {
    func XDTabBarCenterButtonClicked()
}
class XDTabBar: UITabBar,UITabBarDelegate {
    var xdTabBarDelegate:XDTabBarDelegate?
    fileprivate var screenWidth = UIScreen.main.bounds.width
    fileprivate var screenHeight = UIScreen.main.bounds.height
    /**
     中间播放按钮宽度
     */
    fileprivate var centerButtonWidth:CGFloat = 66
    /**
     中间播放按钮高度
     */
    fileprivate var centerButtonHeight:CGFloat = 67
    //中间button
    fileprivate var centerButton:XDTabBarCenterButton = {
        let button = XDTabBarCenterButton.init(frame: CGRect.init(x: 0, y: 0, width: 66, height: 67))
        button.addTarget(self, action: #selector(centerButtonClicked), for: .touchUpInside)
        return button
    }()
    fileprivate var currentItemIndex = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBg()
        addCenterButton()
    }
    //添加中间按钮
    func addCenterButton(){
        self.addSubview(self.centerButton)
    }
    
    func addBg(){
        //添加背景图片
        let bg = UIImageView.init(frame: self.bounds)
        bg.image = UIImage.init(named: "bg_tab")
        self.addSubview(bg)
        self.sendSubviewToBack(bg)
        self.shadowImage = UIImage.init()
        self.backgroundImage = UIImage.init()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //重新布局barItem
        for tabBarItem in self.subviews {
            //布局centerButton
            if String(describing:tabBarItem.self).contains("XDTabBarCenterButton") {
                tabBarItem.center = CGPoint.init(x: self.center.x, y: self.centerButton.bounds.height/2 - 18)
            }
            //布局默认tabBarButton
            debugPrint("tabBarClass:" + String(describing:tabBarItem.self))
            if String(describing:tabBarItem.self).contains("UITabBarButton") {
                var frame = tabBarItem.frame
                frame.size.width = (self.bounds.width - self.centerButton.bounds.width)/CGFloat((self.items?.count)!)
                if currentItemIndex < 2{//如果
                    frame.origin.x = CGFloat(currentItemIndex) * frame.size.width
                }else{
                    frame.origin.x = CGFloat(currentItemIndex) * frame.size.width + self.centerButton.bounds.width
                }
                tabBarItem.frame = frame
                currentItemIndex += 1
                if currentItemIndex == self.items?.count{
                    currentItemIndex = 0
                }
            }
        }
    }
    //重写hitTest方法，让突出的部分也有点击效果
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //这一个判断是关键，不判断的话push到其他页面，点击中间按钮的位置也是会有反应的，这样就不好了
        //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
        //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在中间按钮身上
        //是的话让中间按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
        if self.isHidden == false {
            //将当前tabbar的触摸点转换坐标系，转换到中间按钮的身上，生成一个新的点
            let newP = self.convert(point, to: self.centerButton)
            //判断如果这个新的点是在中间按钮身上，那么处理点击事件最合适的view就是中间按钮
            if self.centerButton.point(inside: newP, with: event){
                return self.centerButton
            }else{//如果点不在发布中间身上，直接让系统处理就可以了
                return super.hitTest(point, with: event)
            }
        }else{//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
            return super.hitTest(point, with: event)
        }
    }
    @objc  func centerButtonClicked(){
        debugPrint("中间按钮点击了")
        if self.xdTabBarDelegate != nil {
            self.xdTabBarDelegate?.XDTabBarCenterButtonClicked()
        }
    }
    deinit {
        self.removeObserver(self, forKeyPath: "name", context: nil)
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
