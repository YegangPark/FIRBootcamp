//
//  BigButtonLabelView.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/12/25.
//

import SwiftUI

struct BigButtonLabelView: View {
    var body: some View {
        BigButtonLabelViewProvider(text: "hello world!")
    }
}

func BigButtonLabelViewProvider(text: String) -> some View {
    Text(text)
        .font(.headline)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
}

#Preview {
    BigButtonLabelView()
}
