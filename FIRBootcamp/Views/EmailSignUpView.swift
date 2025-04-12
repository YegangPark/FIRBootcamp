//
//  EmailSignUpView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI
import Observation
import FirebaseAuth
import FirebaseCore


struct EmailSignUpView: View {
    
    @State private var viewModel = EmailSignUpViewModel()
    @Binding var isSignedIn: Bool
    
    
    var body: some View {
        VStack {
            
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        isSignedIn = true
                    } catch let error {
                        
                        let locDescription = "The email address is already in use by another account."
                        
                        switch error.localizedDescription {
                            
                        case locDescription:
                            try await viewModel.signIn()
                            isSignedIn = true
                        default:
                            print("⚠️ Unexpected error: \(error.localizedDescription)")
                            
                        }
                    }
                }
            } label: {
                BigButtonLabelViewProvider(text: "Sign Up or In")
            }

            
            Spacer()
        }
        .navigationTitle("Sign in with Email")
    }
}

#Preview {
    
    NavigationStack {
        EmailSignUpView(isSignedIn: .constant(true))
    }
}
