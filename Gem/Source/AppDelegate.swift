//
//  AppDelegate.swift
//  Gem
//
//  Created by Melvin John on 23/08/2018.
//  Copyright © 2018 bbc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        
        guard let mainTabBarController = UIStoryboard.instantiateViewControllerFromStoryboard(withName: MainTabBarController.Storyboard.name) as? MainTabBarController else {
            return true
        }

        let navigationCoordinator = MainNavigationCoordinator(destination: mainTabBarController)
        
        navigationCoordinator.prepareForNavigation()
        
        window = mainWindow
        
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
        
        return true
    }


}

