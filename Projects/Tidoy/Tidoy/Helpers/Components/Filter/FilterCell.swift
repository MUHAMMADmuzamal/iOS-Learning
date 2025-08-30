//
//  FilterCell.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import SwiftUI

struct FilterCell: View {
    let model: FilterModel
    let action: (FilterModel) -> Void
    private let height = 30.0
    private let cornerRadius = 30.0 / 2

    var body: some View {
        Button(action: {
            action(model)
        }) {
            Text(model.title)
                .font(.body2XSmallRegular)
                .padding(.vertical, .padding8)
                .padding(.horizontal, .padding12)
                .frame(height: height)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }
    
    private var backgroundColor: Color {
        model.isSelected ? .background20 : .background10
    }

    private var borderColor: Color {
        model.isSelected ? .clear : .stroke40
    }
}

#Preview {
    FilterCell(model: FilterModel.sampleData[0], action: { _ in })
}
