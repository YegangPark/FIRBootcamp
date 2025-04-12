//
//  CommentView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/12/25.
//

import SwiftUI
import Observation


@Observable
final class CommentViewModel {
    
    var commentText: String = ""
    
    func addComment() async {
        do {
            try await CommentManager.shared.uploadComment()
        } catch {
            print("Error uploading comment: \(error.localizedDescription)")
        }
    }
}




struct CommentView: View {
    
    @State private var viewModel = CommentViewModel()
    
    var body: some View {
        
        VStack {
            TextEditor(text: $viewModel.commentText)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding()
            
            Button {
                
                Task {
                    await viewModel.addComment()
                    viewModel.commentText = ""
                }
                
            } label: {
                BigButtonLabelViewProvider(text: "Upload")
            }
        }
    }
}

#Preview {
    NavigationStack {
        CommentView()
    }
}
