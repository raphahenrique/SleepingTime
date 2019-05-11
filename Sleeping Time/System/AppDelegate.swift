//
//  AppDelegate.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 27/04/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("APP STATUS   ------  didFinishLaunchingWithOptions")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(AppDelegate.applicationDidTimeout(notification:)),
                                               name: .appTimeout,
                                               object: nil)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        
        print("APP STATUS  ------  applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("APP STATUS   ------  applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("APP STATUS   ------  applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("APP STATUS   ------  applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("APP STATUS   ------  applicationWillTerminate, don't leave ); ")
    }
    
    
    //MARK: Custom functions
    
    @objc func applicationDidTimeout(notification: NSNotification) {
        
        print("************ application TIMEOUT - that is, device was idle for X time ***************")
        
        
    }

    
    //MARK: Notes
    /*
 
    The timer continues after the app goes to background or the device is locked;
    We could enable/disable the timer or register/unregister the notification in applicationDidBecomeActive and applicationWillResignActive for example
 
    */
    


}

