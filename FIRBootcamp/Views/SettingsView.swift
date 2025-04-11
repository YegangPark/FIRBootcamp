//
//  SettingsView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI
import Observation

struct SettingsView: View {
    
    @Binding var isSignedIn: Bool
    private(set) var viewModel = SettingsViewModel()
    
    var body: some View {
        List {
            Button {
                
            } label: {
                Text("Leave your comment")
            }
            
            
            Button(role: .destructive) {
                viewModel.signOut()
                isSignedIn = false
                
            } label: {
                Text("Sign out")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(isSignedIn: .constant(false))
    }
}
