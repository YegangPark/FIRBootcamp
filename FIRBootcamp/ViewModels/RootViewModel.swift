//
//  RootViewModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/12/25.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import Observation

@Observable
final class RootViewModel {
    
    @MainActor
    func googleSignIn() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResults = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignInResults.user.idToken?.tokenString else {
            throw URLError(.unknown)
        }
        
        let accessToken: String = gidSignInResults.user.accessToken.tokenString
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        try await AuthManager.shared.googleSignIn(credential: credential)
    }
}
