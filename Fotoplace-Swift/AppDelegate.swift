//
//  AppDelegate.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/10.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var slider: DrawerRootVC?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        initShareSdk()
        
        loadLogin()
        
        return true
    }
    
    func loadLogin(){
        let loginVC = LoginVC()
        window?.rootViewController = loginVC
    }

    func loadIndex() {
        let titleArray = ["广场","图片","视频"]
        
        let vc1 = HomeVC()
        vc1.title = titleArray[0]
        vc1.view.backgroundColor = UIColor.white
        let navigation1 = UINavigationController(rootViewController: vc1)
        
        let vc2 = BaseVC()
        vc2.title = titleArray[1]
        vc2.view.backgroundColor = UIColor.green
        let navigation2 = UINavigationController(rootViewController: vc2)
        
        let vc3 = VideoShowVC.init(tableInSets: UIEdgeInsetsMake(0, 0, 0, 0), needToTopRefresh: true, needToFooterRefresh: true, tableViewStyle: .plain)
        vc3.title = titleArray[2]
        vc3.view.backgroundColor = UIColor.white
        let navigation3 = UINavigationController(rootViewController: vc3)
        
        let tabbarController = DrawerTabbarVC()
        tabbarController.viewControllers = [navigation1,navigation2,navigation3]
        
        let tableView = DrawerLeftMenuVC.init(tableInSets: UIEdgeInsetsMake(80.0, 0, 0, 0), needToTopRefresh: false, needToFooterRefresh: false, tableViewStyle: UITableViewStyle.plain)
        
        tableView.selectEvent = {index in
            tabbarController.selectedIndex = index
        }
        
        let slider = DrawerRootVC(rootViewController: tabbarController)
        slider.addShadow()
        slider.addPreloadViewController(tableView, offset:200.0)
        self.slider = slider
        window?.rootViewController = slider
    }
    
    func initShareSdk(){
        ShareSDK.registerApp("2ddd189312ac", activePlatforms:[
        SSDKPlatformType.typeSinaWeibo.rawValue,
        SSDKPlatformType.typeWechat.rawValue,
        SSDKPlatformType.typeQQ.rawValue],
        onImport: { (platform : SSDKPlatformType) in
            switch platform
            {
                case SSDKPlatformType.typeSinaWeibo:
                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                case SSDKPlatformType.typeWechat:
                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                case SSDKPlatformType.typeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                default:
                break
            }
        }) { (platform : SSDKPlatformType, appInfo : NSMutableDictionary?) in
            switch platform
            {
                case SSDKPlatformType.typeSinaWeibo:
                    //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                    appInfo?.ssdkSetupSinaWeibo(byAppKey: "584178949",
                    appSecret : "cdbfe71b99f4aae1826596420d4930c2",
                    redirectUri : "http://www.sina.com",
                    authType : SSDKAuthTypeBoth)
                case SSDKPlatformType.typeWechat:
                    //设置微信应用信息
                    appInfo?.ssdkSetupWeChat(byAppId: "wx42e67c108af71d4b", appSecret: "9031982c7829eb6c8bfd54e25758cdb1")
                case SSDKPlatformType.typeQQ:
                    //设置QQ应用信息
                    appInfo?.ssdkSetupQQ(byAppId: "1101722328",
                    appKey : "TU8TDKxHKGQ4SHuw",
                    authType : SSDKAuthTypeWeb)
                default:
                break
            }
        }
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

