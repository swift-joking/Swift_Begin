//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by Allen on 16/1/28.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    enum ShortcutIdentifier: String {
        
        case First
        case Second
        case Third
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else { return nil }

            self.init(rawValue: last)
        }
        
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }

    }

    var window: UIWindow?
    
    var launchedShortcutItem: UIApplicationShortcutItem?

    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        var handled = false
        
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
        
        guard let shortCutType = shortcutItem.type as String? else { return false }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = UIViewController()
        
        switch (shortCutType) {
        case ShortcutIdentifier.First.type:
            // Handle shortcut 1
            vc = storyboard.instantiateViewController(withIdentifier: "RunVC") as! RunViewController
            handled = true
            break
        case ShortcutIdentifier.Second.type:
            // Handle shortcut 2
            vc = storyboard.instantiateViewController(withIdentifier: "ScanVC") as! ScanViewController
            handled = true
            break
        case ShortcutIdentifier.Third.type:
            // Handle shortcut 3
            vc = storyboard.instantiateViewController(withIdentifier: "WiFiVC") as! SwitchWiFiViewController
            handled = true
            break
        default:
            break
        }
        
        // Display the selected view controller
        window!.rootViewController?.present(vc, animated: true, completion: nil)
        
        return handled
        
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        let handledShortCutItem = handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handledShortCutItem)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        guard let shortcut = launchedShortcutItem else { return }
        
        let isHandle = handleShortCutItem(shortcutItem: shortcut)
        print(isHandle)
        launchedShortcutItem = nil
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            launchedShortcutItem = shortcutItem
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

