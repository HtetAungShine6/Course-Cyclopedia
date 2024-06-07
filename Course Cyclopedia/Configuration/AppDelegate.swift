//
//  AppDelegate.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 07/05/2024.
//

import Foundation
import GoogleSignIn
import Firebase
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    
    //MARK: - Initializing code for Firebase (App Configuration)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        NetworkMonitor.shared.monitorNetwork()
//        TokenManager.share.deleteToken()
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
    
    //MARK: - Handle the URL that application receives at the end of the authentication process
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
