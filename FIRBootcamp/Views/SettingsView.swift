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
    @State private(set) var viewModel = SettingsViewModel()
    @State private var showAlert: Bool = false
    
    var body: some View {
        List {
            NavigationLink("Leave a comment") {
                CommentView()
            }
            .foregroundStyle(Color.accentColor)
            
            NavigationLink("My comment") {
                MyCommentView()
                    .environment(viewModel)
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
