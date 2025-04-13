//
//  UserManager.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/12/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class UserManager {
    
    static var shared = UserManager()
    
    private init() { }
    
    func createUserDoc(for user: UserModel) {
        
        let db = Firestore.firestore()
        
        let userData: [String: Any] = [
            "uid" : user.uid,
            "email" : user.email,
            "comment" : user.comment
        ]

        db.collection("users").document(user.uid).setData(userData, merge: false)
    }
    
}
