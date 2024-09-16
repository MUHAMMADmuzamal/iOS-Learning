//
//  XmarkButton.swift
//  Crypto
//
//  Created by Codes Orbit on 16/09/2024.
//

import SwiftUI

struct XmarkButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XmarkButton()
}
