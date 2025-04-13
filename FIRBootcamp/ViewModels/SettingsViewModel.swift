//
//  SettingsViewModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import Foundation
import Observation

@Observable
final class SettingsViewModel {
    
    func signOut() {
        AuthManager.shared.signOut()
    }
    
    func getUserComment() async -> String {
        do {
            return try await CommentManager.shared.getUserComment()
        } catch {
            print("Error getting user comment: \(error.localizedDescription)")
            return "Could not load comment."
        }
    }
}
