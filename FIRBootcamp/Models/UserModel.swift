//
//  UserModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import FirebaseAuth
import FirebaseCore

struct UserModel: Codable, Identifiable {
    let uid: String
    let id: String
    let email: String?
    var comment: String = ""
    var username: String = ""
    var avatarURL: URL?
    
    init(user: User) {
        uid = user.uid
        id = user.uid
        email = user.email
    }
    
    init() {
        uid = "324324324"
        id = "324324324"
        email = "realdonaldtrump@gmail.com"
        comment = "This is a test comment"
        username = "Trump"
        avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/83/TrumpPortrait.jpg")
    }
    
    static let fake = UserModel()
}
