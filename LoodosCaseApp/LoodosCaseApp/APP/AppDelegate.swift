//
//  AppDelegate.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        applyFrameworks()
        NavigationManager.showSplash()
        return true
    }
    
    private func applyFrameworks() {
        NetworkStatusManager.shared.checkInternetConnection()
        FirebaseManager.configureFirebase()
        FirebaseManager.shared.configureRemoteConfig()
    }
}

