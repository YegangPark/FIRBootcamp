//
//  MutableMainView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI

struct MutableMainView: View {
  
    @State private var isSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(isSignedIn: $isSignedIn)
            }
        }
        .onAppear {
            let authUser = AuthManager.shared.getAuthenticatedUser()
            isSignedIn = authUser != nil
        }
        .fullScreenCover(isPresented: .constant(!isSignedIn)) {
            RootView(isSignedIn: $isSignedIn)
        }
    }
}

#Preview {
    MutableMainView()
}
