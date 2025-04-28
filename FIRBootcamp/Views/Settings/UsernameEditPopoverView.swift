//
//  UsernameEditPopoverView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/17/25.
//

import SwiftUI

struct UsernameEditPopoverView: View {
    
    @Environment(SettingsViewModel.self) private var viewModel
    @Binding private(set) var inputText: String
    
    var body: some View {
        TextField("username", text: $inputText)
        
        Button("Cancel", role: .cancel) {
            print("Cancelled")
        }
        
        Button("Change", role: .none) {
            Task {
                await viewModel.changeUsername(newUsername: inputText)
                inputText = ""
                await viewModel.loadUser()
            }
            print("Changed to: \(inputText)")
        }
    }
}


#Preview {
    UsernameEditPopoverView(inputText: .constant("iewjro"))
}
