//
//  SettingsView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isSignedIn: Bool
    @State private var viewModel = SettingsViewModel()
    @State private var showDialog = false
    @State private var nameFieldPresented = false
    
    var body: some View {
        List {
            profileButton
            
            profileSettingsSection(viewModel: viewModel)
            
            signOutCell(viewModel: viewModel)
        }
        .navigationTitle("Settings")
        .task {
            await viewModel.loadUser()
        }
        .confirmationDialog("Edit your profile", isPresented: $showDialog, titleVisibility: .visible) {
            Button("Change username") {
                nameFieldPresented = true
            }
            
            Button("Change avatar") {
                
            }
            
            Button("Cancel", role: .cancel) { }
        }
        .alert("Change username", isPresented: $nameFieldPresented) {
            UsernameEditPopoverView(inputText: $viewModel.inputText)
                .environment(viewModel)
        }
    }
}







extension SettingsView {
    
    private var profileButton: some View {
        Section {
            Button {
                showDialog = true
            } label: {
                if let user = viewModel.userModel {
                    ProfileListRowView(user: user)
                } else {
                    ProfileListRowView(user: UserModel.fake)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    
    private func profileSettingsSection(viewModel: SettingsViewModel) -> some View {
        Section {
            Text(viewModel.currentUserEmail)
            
            NavigationLink("Leave a comment") {
                CommentView()
            }
            .foregroundStyle(Color.accentColor)
            
            NavigationLink("My comment") {
                MyCommentView()
                    .environment(viewModel)
            }
        }
    }
    
    private func signOutCell(viewModel: SettingsViewModel) -> some View {
        Section {
            Button(role: .destructive) {
                viewModel.signOut()
                isSignedIn = false
                
            } label: {
                Text("Sign out")
            }
        }
    }
    
}






#Preview {
    NavigationStack {
        SettingsView(isSignedIn: .constant(false))
    }
}
