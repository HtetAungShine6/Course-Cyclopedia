//
//  AppStateHandler.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 13/05/2024.
//

import Foundation

struct AppStateHandler {
    
    static func userSignInState() {
        UserDefaults.standard.set(true, forKey: "signIn")
    }
    
    static func userSignOutState() {
        UserDefaults.standard.setValue(false, forKey: "signIn")
    }
    
}
