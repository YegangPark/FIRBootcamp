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
    
    var userModel: UserModel? = nil
    
    var currentUserEmail: String {
        AuthManager.shared.currentUser?.email ?? "Anonymous"
    }
    
    func loadUser() async {
        do {
            userModel = try await UserManager.shared.getUserModel()
            print("userModel allocated")
        } catch {
            print("Error loading user: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try AuthManager.shared.signOut()
        } catch {
            print("Error signing out user: \(error.localizedDescription)")
        }
    }
    
    func getUserComment() async -> String {
        do {
            return try await CommentManager.shared.getUserComment()
        } catch {
            print("Error getting user comment: \(error.localizedDescription)")
            return "Could not load comment."
        }
    }
    
// MARK: Change Username
    var inputText: String = ""
    
    func changeUsername(newUsername: String) async {
        await UserManager.shared.updateUsername(newUsername: newUsername)
    }    
}
