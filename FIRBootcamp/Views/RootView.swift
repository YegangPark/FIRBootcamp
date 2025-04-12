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
                    Text("Sign in with Email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
                Button("Sign in with Google") {
                    Task {
                        do {
                            try await viewModel.googleSignIn()
                            isSignedIn = true
                            
                        } catch {
                            print("Error signing in: \(error)")
                        }
                    }
                }
                .foregroundStyle(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
//
//                GoogleSignInButton(scheme: .dark, style: .standard, state: .normal) {
//                    Task {
//                        do {
//                            try await viewModel.googleSignIn()
//                            isSignedIn = true
//                            
//                        } catch {
//                            print("Error signing in: \(error)")
//                        }
//                    }
//                }
//                .padding()
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
