//
//  UserModel.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import SwiftUI
import Observation
import FirebaseAuth
import FirebaseCore

struct UserModel {
    let uid: String
    let email: String
    
    init(user: User) {
        uid = user.uid
        email = user.email ?? ""
    }
}
