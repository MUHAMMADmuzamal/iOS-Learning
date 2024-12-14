//
//  XmarkButton.swift
//  Tidoy
//
//  Created by Codes Orbit on 29/09/2024.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.dismiss) var dissmiss
    
    var body: some View {
        Button {
            dissmiss()
        } label: {
            Image(systemName: "xmark")
                .frame(width: 14, height: 14)
                .foregroundStyle(.icon100)
        }

    }
}

#Preview {
    XmarkButton()
}
