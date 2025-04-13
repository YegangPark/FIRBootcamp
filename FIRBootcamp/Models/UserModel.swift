//
//  UserModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import FirebaseAuth
import FirebaseCore

struct UserModel: Codable {
    let uid: String
    let email: String
    var comment: String = ""
    
    init(user: User) {
        uid = user.uid
        email = user.email ?? ""
    }
}
