//
//  SendButton.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/06/2025.
//

import SwiftUI

struct SendButton<Background: ShapeStyle, IconColor: ShapeStyle>: View {
    let size: CGFloat
    let icon: Image
    let iconScale: CGSize
    let backgroundStyle: Background
    let iconStyle: IconColor
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(backgroundStyle)
                .overlay {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: size * iconScale.width,
                            height: size * iconScale.height
                        )
                        .foregroundStyle(iconStyle)
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SendButton(
        size: 40,
        icon: Image(.send),
        iconScale: CGSize(width: 0.45, height: 0.38),
        backgroundStyle: .infoMain,
        iconStyle: .neutral10
    ) {
        print("Send tapped!")
    }

}
