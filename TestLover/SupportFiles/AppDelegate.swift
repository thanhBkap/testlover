//
//  AppDelegate.swift
//  MVVMRx
//
//  Created by Mohammad Zakizadeh on 9/27/18.
//  Copyright © 2018 storm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
//        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
//        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "home")
//        window?.rootViewController = homeVC
//        window?.makeKeyAndVisible()
        UIApplication.shared.isStatusBarHidden = true

        let loverStoryboard = UIStoryboard(name: "Lover", bundle: nil)
        let loverVC = loverStoryboard.instantiateViewController(withIdentifier: "main_navi")
        window?.rootViewController = loverVC
        window?.makeKeyAndVisible()
        return true
    }

}

