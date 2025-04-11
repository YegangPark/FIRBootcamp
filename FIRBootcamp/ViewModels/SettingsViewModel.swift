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
}
