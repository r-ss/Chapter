//
//  AppDelegate.swift
//  chapter
//
//  Created by Alex Antipov on 03/10/15.
//  Copyright © 2015 Alex Antipov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let books:Books = Books()
    
    var window: UIWindow?
    
    

    var navigationController: UINavigationController {
        return window!.rootViewController as! UINavigationController
    }
    
    lazy var primaryViewController: UIViewController = {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Primary")
    }()
    
    
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        navigationController.navigationBar.barTintColor = Palette.Dark.color
        navigationController.navigationBar.tintColor = Palette.White.color
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Palette.White.color]
        
        //navigationController.title = "Hello"
        //let navigationItem = UINavigationItem.init(title: "Hello")
        //navigationItem.rightBarButtonItems = UIBarButtonItem.init(title: "ADD", style: <#T##UIBarButtonItemStyle#>, target: <#T##AnyObject?#>, action: <#T##Selector#>)
        //navigationController.navigationBar.items = [navigationItem]
        
        books.loadSampleBooks()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        print("AppDelegate > applicationWillResignActive")
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        print("AppDelegate > applicationDidEnterBackground")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        print("AppDelegate > applicationWillEnterForeground")
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        print("AppDelegate > applicationDidBecomeActive")
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        print("AppDelegate > applicationWillTerminate")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

