//
//  Course_CyclopediaApp.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI

@main
struct Course_CyclopediaApp: App {
    // To handle app delegate callbacks in an app that uses the SwiftUI lifecycle,
      // you must create an application delegate and attach it to your `App` struct
      // using `UIApplicationDelegateAdaptor`.
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @AppStorage("signIn") var isSignIn = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TokenManager.share)
        }
    }
}
