//
//  AppDelegate.swift
//  Tasks
//
//  Created by amela on 21/10/15.
//  Copyright © 2015 amela. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //printKvadrat()
        
        let tasksArchived = NSUserDefaults.standardUserDefaults().objectForKey("tasks") as? NSData ?? NSData()
        TaskManager.sharedTM.tasks = TaskManager.sharedTM.load(tasksArchived)
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(TaskManager.sharedTM.tasks)
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(TaskManager.sharedTM.tasks)
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        TaskManager.sharedTM.tasks = []
    }

    func applicationDidEnterBackground(application: UIApplication) {
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(TaskManager.sharedTM.tasks)
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        let tasksData = NSKeyedArchiver.archivedDataWithRootObject(TaskManager.sharedTM.tasks)
        NSUserDefaults.standardUserDefaults().setObject(tasksData, forKey: "tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print("pognal sem tole")
        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //func application


}

