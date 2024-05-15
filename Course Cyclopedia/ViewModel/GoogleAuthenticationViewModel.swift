//
//  Authentication.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import Foundation
import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth

//MARK: - Goolge Sign In Function
class GoogleAuthenticationViewModel: ObservableObject {
 
    @Published var errorMessage = ""
    
    func signInWithGoogle(presenting: UIViewController, completion: @escaping (Error?, Bool) -> Void) {
        
        guard let clientID = FirebaseManager.shared.firebaseApp?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) { user, error in
            if let error = error {
                self.errorMessage = "Failed to Sign In with instance: \(error)"
                DispatchQueue.main.async {
                    completion(error, false)
                }
                return
            }
            
            guard let user = user?.user, let idToken = user.idToken else {
                DispatchQueue.main.async {
                    completion(nil, false)
                }
                return
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            guard let currentUserToken = FirebaseManager.shared.auth.apnsToken else {
                print("OH SHIT")
                return
            }
            
//            FirebaseManager.shared.auth.tenantID
            
            FirebaseManager.shared.auth.signIn(with: credential) { authResult, error in
                if let error = error {
                    self.errorMessage = "Failed to Sign In with credentials: \(error)"
                    DispatchQueue.main.async {
                        completion(error, false)
                    }
                    return
                }
                
                guard let authResult = authResult else {
                    DispatchQueue.main.async {
                        completion(NSError(domain: "FirebaseAuthError", code: -1, userInfo: nil), false)
                    }
                    return
                }
                
                let isNewUser = authResult.additionalUserInfo?.isNewUser ?? false
                DispatchQueue.main.async {
                    completion(nil, isNewUser)
                }
                
                if !isNewUser{
                    AppStateHandler.userSignInState()
                    print("This user already exists")
                } else {
                    print("There's a new user!!!")
                    AppStateHandler.userSignOutState()
                }
                print("ID Token: \(idToken)")
//                print("Current Tokem: \(currentUserToken)")
            }
        }
    }
    
    func signOutWithGoogle(){
        do {
            try FirebaseManager.shared.auth.signOut()
            AppStateHandler.userSignOutState()
        } catch let signOutError as NSError {
            self.errorMessage = "Failed to sign out with error: \(signOutError)"
        }
    }
}
