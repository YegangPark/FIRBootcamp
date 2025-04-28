//
//  ProfileListRowView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/14/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Observation


struct ProfileListRowView: View {
    
    private(set) var user: UserModel
    
    var body: some View {
        HStack {
            AvatarViewProvider(user: user)
            
            usernameEmailView(user: user)
        
            Spacer()
            
            if let comment = user.comment {
                commentView(comment: comment)
            }
        }
    }
}


extension ProfileListRowView {
    
    private func AvatarViewProvider(user: UserModel) -> some View {
        ZStack {
            Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.circle)
                    .frame(width: 49, height: 49)
            
            if let url = URL(string: user.avatarURLstring) {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.circle)
                    .frame(width: 49, height: 49)
            }
        }
    }
    
    
    
    private func usernameEmailView(user: UserModel) -> some View {
        VStack(alignment: .leading) {
            Text(user.username ?? "No username")
                .font(.headline)
                
            Text(user.email ?? "No email")
                .font(.caption)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
    }
    
    
    
    private func commentView(comment: String) -> some View {
        Text(comment)
            .font(.caption)
            .minimumScaleFactor(0.6)
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 5)
            .background(.thinMaterial)
            .cornerRadius(7)
    }
}




#Preview(traits: .sizeThatFitsLayout) {
    List {
        ProfileListRowView(user: UserModel.fake)
    }
}
