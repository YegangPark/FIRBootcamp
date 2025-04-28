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
    var comment: String?
    var username: String?
    var avatarURLstring: String = "https://i.pinimg.com/736x/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg"
    
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
        avatarURLstring = "https://upload.wikimedia.org/wikipedia/commons/8/83/TrumpPortrait.jpg"
    }
    
    static let fake = UserModel()
}
