//
//  LogInView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI
import Firebase
import GoogleSignInSwift

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String? = nil
    @State private var isNewUser = false
    @ObservedObject var authViewModel = GoogleAuthenticationViewModel()
//    @ObservedObject var tokenManager = TokenManager.share
    
    var body: some View {
        loginView
        // This is just printing out the token just to make sure eveything's OK T_T
            .onReceive(authViewModel.$token){ token in
                if let token = token {
                    print("Received token: \(token)")
                }
            }
    }
    
    //MARK: - Login View
    private var loginView: some View{
        VStack {
            Image("AppLogo")
                .resizable()
                .frame(width:150,height:150)
            
            Spacer().frame(height: 20)
            
            Text("Course")
                .foregroundColor(.appColor)
                .font(.title)
                .fontWeight(.bold)
            
            Text("cyclopedia")
                .foregroundColor(.appColor)
                .font(.body)
                .fontWeight(.bold)
            
            Spacer().frame(height: 100)
            
            TextField("Email",text : $email)
                .padding()
                .frame(width: 300,height: 50)
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.appColor,lineWidth:1.4)
                )
            
            Spacer().frame(height: 40)
            
            TextField("Password",text : $password)
                .padding()
                .frame(width: 300,height: 50)
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.appColor,lineWidth:1.4)
                )
            
            Spacer().frame(height: 50)
            
            Button("Sign in"){
                
            }
            .foregroundColor(.white)
            .frame(width: 100,height: 50)
            .background(Color.appColor)
            .cornerRadius(50)
            .shadow(color:.shadowColor,radius: 8,y:8)
            .fontWeight(.bold)
            
            Spacer().frame(height: 15)
            
            Text("OR")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(Color.gray)
            
            Spacer().frame(height: 15)
            
            googleButton
        }
    }
    
    //MARK: - Google Button
    private var googleButton: some View {
        if let existingUserId = UserDefaults.standard.string(forKey: "ExistedAccount") {
            Button {
                signInWithGoogle()
            } label: {
                Image("continueWithGoogle")
            }
        } else {
            Button {
                signInWithGoogle()
            } label: {
                Image("testGoogle")
            }
        }
    }
    
    //MARK: - Sign in with Google/Continue with Google
    private func signInWithGoogle(){
        authViewModel.signInWithGoogle(presenting: Application_utility.rootViewController) { error, isNewUser in
            
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                if isNewUser {
                    AppStateHandler.saveAccountAvailability(userId: FirebaseManager.shared.currentUser)
                    self.isNewUser = isNewUser
                } else {
                    self.isNewUser = !isNewUser
                }
            }
        }
    }
}
//
//#Preview {
//    LogInView()
//}
