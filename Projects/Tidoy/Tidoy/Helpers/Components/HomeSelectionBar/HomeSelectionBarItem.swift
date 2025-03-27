//
//  HomeSelectionBarItem.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/03/2025.
//

import SwiftUI

struct HomeSelectionBarItem: View {
    let model: HomeSelectionBarItemModel
    let onTap: ((String) -> Void)?
    var body: some View {
        VStack {
            Image(model.iconName)
            Text(model.title)
            
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(model.isSelected ? .icon100 : .clear)
        }
        .foregroundStyle(model.isSelected ? .icon100 : .icon60)
        .onTapGesture {
            onTap?(model.id)
        }
    }
}

#Preview {
    
    HStack {
        ForEach(HomeSelectionBarItemModel.selectionBarItemsList) { model in
            HomeSelectionBarItem(model: model) { id in
                let _ = HomeSelectionBarItemModel.selectionBarItemsList.map { model in
                    var model = model
                    if model.id == id {
                        model.isSelected = true
                    }else {
                        model.isSelected = false
                    }
                    return model
                }
            }
        }
    }
    .frame(height: 70)
}
