//
//  XDTabBarController.swift
//  XDTabBarController
//
//  Created by admin on 2017/11/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit
 @objc protocol XDTabBarControllerDelegate:NSObjectProtocol {
    @objc optional func XDTabBarControllerDidSelectedItemAtIndex(tabBarController:XDTabBarController,index:Int)//选择item
    @objc optional func XDTabBarControllerDidSelectedCenterButton(tabBarController:XDTabBarController)//点击中间按钮
}
class XDTabBarController: UITabBarController,XDTabBarDelegate {
    var xdTabBarControllerDelegate:XDTabBarControllerDelegate?{
        didSet{
            let de = xdTabBarControllerDelegate
            delegates.append(de!)
        }
    }
    fileprivate var delegates:Array<XDTabBarControllerDelegate> = []
    //当前选中的是第几个item
    var currentItemIndex = 0
    fileprivate var screenHeight = UIScreen.main.bounds.height
    fileprivate var screenWidth = UIScreen.main.bounds.width
    fileprivate var tabBarItems:Array<UITabBarItem> = []
    fileprivate var tabBarItemTag = 0
    
    fileprivate lazy var tabbar:XDTabBar = {
        var height:CGFloat = 49
        if UIScreen.main.bounds.size.height >= 812{
            height = 49 + 34
        }
        let tab = XDTabBar.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height - height, width: UIScreen.main.bounds.width, height: height))
        tab.xdTabBarDelegate = self
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加自定义的tabBar
        addTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    fileprivate func addTabBar(){
        self.setValue(self.tabbar, forKey: "tabBar")
    }
    func addChildController(childController:UIViewController,title:String,normalImage:String,selectedImage:String){
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
    childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.init(name: XDFont.pingFangSCMedium.rawValue, size: 10)!,NSAttributedString.Key.foregroundColor:UIColor.colorWithHexString(hex: "#333334")], for: .selected)
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.init(name: XDFont.pingFangSCMedium.rawValue, size: 10)!,NSAttributedString.Key.foregroundColor:UIColor.colorWithHexString(hex: "#BDBDBD")], for: .normal)
        childController.tabBarItem.tag = tabBarItemTag
        tabBarItemTag += 1
        tabBarItems.append(childController.tabBarItem)
        self.addChild(childController)
    }

    /**
     *TabBarDelegate
     **/
    func XDTabBarCenterButtonClicked() {
        //点击了中间按钮\
        if self.delegates.count != 0 {
            debugPrint("点击了中间按钮")
            self.delegates.forEach({ (dele) in
                dele.XDTabBarControllerDidSelectedCenterButton!(tabBarController: self)
            })
        }
    }
    /**
     获取当前显示的viewController
     */
    func getCurrentViewController() -> UIViewController{
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        if let tabController = rootController as? UITabBarController   {
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.children.last!
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {

            return navController.children.last!
        }else{

            return rootController!
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        super.tabBar(tabBar, didSelect: item)
        if self.delegates.count != 0 {
            currentItemIndex = self.tabBarItems.index(of: item)!
            self.delegates.forEach({ (dele) in
                dele.XDTabBarControllerDidSelectedItemAtIndex!(tabBarController: self, index: currentItemIndex)
            })
        }
    }
    // 隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        get {
            return false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
