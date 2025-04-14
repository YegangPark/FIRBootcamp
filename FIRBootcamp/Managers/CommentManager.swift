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
    
    private let db = Firestore.firestore()
    
    private var user: UserModel? {
        AuthManager.shared.getAuthenticatedUser()
    }
    
    func addComment(comment: String) async throws {
        
        guard let user = user else { throw URLError(.badServerResponse) }
        
        try await db.collection("users").document(user.uid).updateData(["comment": comment])
    }
    
    func getUserComment() async throws -> String {
        
        guard let user = user else { throw URLError(.badServerResponse) }

        let doc = try await db.collection("users").document(user.uid).getDocument()
        
        guard let data = doc.data() else {
            throw URLError(.cannotCloseFile)
        }
        
        return data["comment"] as? String ?? ""
    }
}
