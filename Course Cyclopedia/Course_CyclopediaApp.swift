//
//  Course_CyclopediaApp.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI

@main
struct Course_CyclopediaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("signIn") var isSingIn = false
    
    var body: some Scene {
        WindowGroup {
            if !isSingIn{
                LogInView()
            } else {
                ProfileView()
            }
        }
    }
}
