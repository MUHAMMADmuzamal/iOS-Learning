//
//  BackButton.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/04/2025.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var body: some View {
          Circle()
            .fill(Color.background10)
            .frame(height: 52)
            .overlay(alignment: .center) {
                Image(systemName: "chevron.compact.left")
                    .resizable()
                    .foregroundStyle(Color.icon100)
                    .frame(width: 6, height: 10)
            }
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    BackButton(){
        print("hello")
    }
}
