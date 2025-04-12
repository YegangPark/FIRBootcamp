//
//  EmailSignUpViewModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import Foundation
import Observation
import FirebaseAuth
import FirebaseCore


@Observable
final class EmailSignUpViewModel {
    var email: String = ""
    var password: String = ""
    
    func signUp() async throws {
        try await AuthManager.shared.EmailSignUp(email: email, password: password)
        
        guard let user = AuthManager.shared.getAuthenticatedUser() else {
            print("Couldn't get user")
            return
        }
        UserManager.shared.createUserDoc(for: user)
    }
    
    func signIn() async throws {
        do {
            try await AuthManager.shared.EmailSignIn(email: email, password: password)
        } catch {
            print("Error signing in: \(error.localizedDescription)")
        }
    }
}
