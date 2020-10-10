//
//  AppDelegate.swift
//  MyCart
//
//  Created by Sherif on 10/7/20.
//  Copyright © 2020 Sherif. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        startApplicationPoint()
        return true
    }
    
    // MARK: - start Application
    func startApplicationPoint() {
        let splashScreen = SplashViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splashScreen
        window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(dismissSplashScreen), userInfo: nil, repeats: false)
    }
    
    // MARK: - application state Point
    func handleApplicationStartingPoint() {
        let appLaunchedBefore = UserDefaults.standard.bool(forKey: "AppLanuchedBefore")
        let onBoardingViewController = UIZawyaNavigationController(rootViewController: Onboarding())
        let homeViewController = TabBarViewController(viewModel: TabBarViewModel())
        var viewController: UIViewController
        
        if appLaunchedBefore {
            viewController = homeViewController
        }else {
            viewController = onBoardingViewController
        }
        UserDefaults.standard.set(true, forKey: "AppLanuchedBefore")
        window?.rootViewController = viewController
    }
    
    // MARK: - action
    @objc func dismissSplashScreen() {
        handleApplicationStartingPoint()
    }
}
