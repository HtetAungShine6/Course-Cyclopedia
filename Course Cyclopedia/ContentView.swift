//
//  ContentView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tokenManager: TokenManager
    
    var body: some View {
        if tokenManager.isTokenValid {
            ProfileView()
        } else {
            LogInView()
        }
    }
}

#Preview {
    ContentView()
}
