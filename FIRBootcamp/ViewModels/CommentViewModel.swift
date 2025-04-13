//
//  CommentViewModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/13/25.
//

import Foundation
import Observation


@Observable
final class CommentViewModel {
    
    var commentText: String = ""
    
    func addComment() async {
        do {
            try await CommentManager.shared.addComment(comment: commentText)
        } catch {
            print("Error uploading comment: \(error.localizedDescription)")
        }
    }
}
