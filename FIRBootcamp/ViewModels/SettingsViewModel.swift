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
    
    @discardableResult
    func getMyComment() -> String {
        guard let comment = AuthManager.shared.getAuthenticatedUser()?.comments else {
            return "No comment"
        }
        return comment
    }
    
    var commentButtonText: String {
        getMyComment()
    }
}
