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
import FirebaseFirestore
import GoogleSignIn
import GoogleSignInSwift

class AuthManager {
    
    var currentUser: UserModel? {
        if let user = Auth.auth().currentUser {
            return UserModel(user: user)
        } else {
            return nil
        }
    }
    
    var signInMethod: SignInMethod?
    
    static var shared = AuthManager()
    
    private init() { }
    
    // MARK: Universal
    
    
    func getAuthenticatedUser() -> UserModel? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        print("Got User: \(user.email ?? "No Email")")
        return UserModel(user: user)
    }
    
    func signOutFIRAuth() {
        do {
            try Auth.auth().signOut()
            signInMethod = nil
            print("Signed out from Firebase successfully")
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    func signOut() throws {
        
        switch signInMethod {
        
        case .email:
            print("Auth method found: Email")
            signOutFIRAuth()
            
        
        case .google:
            print("Auth method found: Google")
            signOutGID()
            
        default: throw URLError(.badServerResponse)
            
        }
    }
    
    
    enum SignInMethod {
        case email
        case google
    }
    
    
    // MARK: Email signing
    func EmailSignUp(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
        signInMethod = .email
        print("Auth method allocated: Email")
    }
    
    func EmailSignIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
        signInMethod = .email
        print("Auth method allocated: Email")
    }
    
    
    // MARK: Google signing
    func googleSignIn(credential: AuthCredential) async throws {
        try await Auth.auth().signIn(with: credential)
        signInMethod = .google
        print("Auth method allocated: Google")
    }
    
    func signOutGID() {
        signOutFIRAuth()
        GIDSignIn.sharedInstance.signOut()
        print("Signed out from Google")
    }
    
}
