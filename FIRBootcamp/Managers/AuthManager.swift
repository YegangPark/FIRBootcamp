//
//  SignUpManager.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI
import Observation
import FirebaseAuth
import FirebaseCore

class AuthManager {
    
    var currentUser: UserModel?
    
    static var shared = AuthManager()
    
    // MARK: Email signing
    func EmailSignUp(email: String, password: String) async throws {
        let signUpResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        currentUser = UserModel(user: signUpResult.user)
    }
    
    func EmailSignIn(email: String, password: String) async throws {
        let signInResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        currentUser = UserModel(user: signInResult.user)
    }
    
    
    // MARK: Google signing
    func googleSignIn(credential: AuthCredential) async throws {
        try await Auth.auth().signIn(with: credential)
    }
    
    
    
    
    
    
    // MARK: Universal
    
    func signOut() {
        
        do {
            try Auth.auth().signOut()
            
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    func getAuthenticatedUser() -> UserModel? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return UserModel(user: user)
    }
    
}
