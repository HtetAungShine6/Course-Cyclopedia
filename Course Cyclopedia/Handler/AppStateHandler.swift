//
//  AppStateHandler.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 13/05/2024.
//

import Foundation

struct AppStateHandler {
    
    static func saveAccountAvailability(userId: String){
        UserDefaults.standard.set(userId, forKey: "ExistedAccount")
    }
}
