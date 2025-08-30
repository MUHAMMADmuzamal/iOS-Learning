//
//  FilterButton.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import SwiftUI

struct FilterButton: View {
    let action: () -> Void
    private let height = 30.0
    private let cornerRadius = 30.0 / 2
    @State private var selected = false

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: .padding4) {
                Image("filterIcon")
                    .foregroundStyle(Color.icon100)
                Text("Filter")
                    .font(.body2XSmallRegular)
            }
            .padding(.vertical, .padding8)
            .padding(.horizontal, .padding12)
            .frame(height: height)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: 1)
            )
            .overlay {
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.dangerMain)
                        .frame(height: 16)
                        .overlay {
                            Text("99")
                                .font(Font.body2XSmallRegular)
                        }
                        .offset(y: -15)
                        .padding(.trailing, .padding4)
                        
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var backgroundColor: Color {
        selected ? .background20 : .background10
    }

    private var borderColor: Color {
        selected ? .clear : .stroke40
    }
}

#Preview {
    FilterButton(action: {})
}
