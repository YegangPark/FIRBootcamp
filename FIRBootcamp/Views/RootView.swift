//
//  RootView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import Observation


struct RootView: View {
    
    @State private(set) var viewModel = RootViewModel()
    @Binding var isSignedIn: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink {
                    EmailSignUpView(isSignedIn: $isSignedIn)
                } label: {
                    BigButtonLabelViewProvider(text: "Sign in with Email")
                }
             
                GoogleSignInButton(scheme: .dark, style: .wide, state: .normal) {
                    Task {
                        do {
                            try await viewModel.googleSignIn()
                            isSignedIn = true
                            
                        } catch {
                            print("Error signing in: \(error)")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Sign-in methods")
        }
    }
}

#Preview {
    NavigationStack {
        RootView(isSignedIn: .constant(true))
    }
}
