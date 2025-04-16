//
//  ProfileListRowView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/14/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileListRowView: View {
    let fakeUser = UserModel.fake
    var body: some View {
        HStack {
            WebImage(url: fakeUser.avatarURL!)
                .resizable()
                .clipShape(.circle)
                .frame(width: 49, height: 49)
            
            VStack(alignment: .leading) {
                Text(fakeUser.username)
                    .font(.headline)
                    
                Text(fakeUser.email ?? "No email")
                    .font(.caption)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            
            Spacer()
            
            Text(fakeUser.comment)
                .font(.caption)
                .frame(maxHeight: .infinity)
                .padding(.horizontal)
                .background(.thinMaterial)
                .cornerRadius(7)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    List {
        ProfileListRowView()
    }
}
