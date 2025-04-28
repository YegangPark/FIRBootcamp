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
    
    private let db = Firestore.firestore()
    
    var currentUser = AuthManager.shared.currentUser
    
    func createUserDoc(for user: UserModel) {
        do {
            let data = try Firestore.Encoder().encode(user)
            db.collection("users").document(user.uid).setData(data)
        } catch {
            print("Error encoding user doc: \(error)")
        }
    }
    
    
    func createUserDocIfNotExists() async {
        guard let userModel = try? await getUserModel() else {
            return
        }
        UserManager.shared.createUserDoc(for: userModel)
    }
    
    func updateUsername(newUsername: String) async {
        guard let user = currentUser else {
            print("Couldn't get user")
            return
        }
        
        do {
            try await db.collection("users").document(user.uid).setData(["username" : newUsername], merge: true)
            print("New username uploaded to db!")
        } catch {
            print("Error updating username: \(error)")
        }
    }
    
    func getUserModel() async throws -> UserModel? {
        
        guard let user = currentUser else { return nil }
        
        return try await db.collection("users").document(user.uid).getDocument(as: UserModel.self)
    }
}
