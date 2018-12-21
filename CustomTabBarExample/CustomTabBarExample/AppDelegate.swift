//
//  AppDelegate.swift
//  CustomTabBarExample
//
//  Created by 孙晓栋 on 2018/12/2.
//  Copyright © 2018 Sinder. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = XDTabBarController()
        let homeNV:UINavigationController = UINavigationController.init(rootViewController: ViewController())
        
        let subScribeNV:UINavigationController = UINavigationController.init(rootViewController: SecondViewController())
        
        let personalNV:UINavigationController = UINavigationController.init(rootViewController: ThirdViewController())
        let attentionNV:UINavigationController = UINavigationController.init(rootViewController: FourthViewController())
        tabBarController.addChildController(childController: homeNV, title: "精选", normalImage: "icon_tab_精选常态", selectedImage: "icon_tab_精选点击态")
        tabBarController.addChildController(childController: subScribeNV, title: "关注", normalImage: "icon_tab_频道常态", selectedImage: "icon_tab_频道点击态")
        tabBarController.addChildController(childController: personalNV, title: "订阅", normalImage: "icon_tab_订阅常态", selectedImage: "icon_tab_订阅点击态")
        tabBarController.addChildController(childController: attentionNV, title: "我的", normalImage: "icon_tab_我的常态", selectedImage: "icon_tab_我的点击态")
        self.window?.rootViewController = tabBarController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

