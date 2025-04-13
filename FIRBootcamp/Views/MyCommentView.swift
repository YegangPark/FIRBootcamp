//
//  MyCommentView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/13/25.
//

import SwiftUI

struct MyCommentView: View {
    
    @State private var comment: String = ""
    @Environment(SettingsViewModel.self) private var viewModel
    
    var body: some View {
        Text(comment)
            .task {
                comment = await viewModel.getUserComment()
            }
    }
}

#Preview {
    MyCommentView()
}
