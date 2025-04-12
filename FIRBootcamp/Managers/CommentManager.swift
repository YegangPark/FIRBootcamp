//
//  CommentManager.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/12/25.
//

import Foundation
import FirebaseFirestore


final class CommentManager {
    
    static var shared = CommentManager()
    
    private init() { }
    
    func uploadComment() async throws {
        
        guard let user = AuthManager.shared.getAuthenticatedUser() else {
            return
        }
                
        let db = Firestore.firestore()
        let newComment = "Ye Park"
        
        try await db.collection("users").document(user.uid)
            .updateData(["comment": newComment])
    }
    
    
}
