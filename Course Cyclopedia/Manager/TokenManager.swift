//
//  TokenManager.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 28/05/2024.
//

import Foundation
import KeychainAccess
import JWTDecode

class TokenManager: ObservableObject {
    
    static let share = TokenManager()
    private let keychain = Keychain(service: "course_cyclopedia_user_tokens")
    
    // MARK: - Save Tokens in keychain
    func saveTokens(token: String) {
        do {
            try keychain.set(token, key: "userToken")
        } catch {
            print("Error saving tokens: \(error)")
        }
    }
    
    // MARK: - Get Tokens for headers and API calls
    func getToken() -> String? {
        do {
            return try keychain.get("token")
        } catch {
            print("Error retrieving token: \(error)")
            return nil
        }
    }
    
    // MARK: - Delete Tokens
    func deleteToken() {
        do {
            try keychain.remove("userToken")
        } catch {
            print("Error deleting token: \(error)")
        }
    }
    
    // MARK: - check the validility of token (not sure T_T)
    func isTokenValid() -> Bool {
        guard let token = getToken() else {
            return false
        }
        do{
            let jwt = try decode(jwt: token)
            guard let expiresAt = jwt.expiresAt else {
                return false
            }
            let adjustedExpiryDate = expiresAt.addingTimeInterval(-7200)
            return Date() < adjustedExpiryDate
        } catch {
            print("Error decoding token: \(error)")
            return false
        }
    }
}
