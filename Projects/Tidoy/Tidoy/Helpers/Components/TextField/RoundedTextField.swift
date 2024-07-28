//
//  RoundedTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/07/2024.
//

import SwiftUI

struct RoundedTextField: View {
    private enum StateOfTextField {
        case defaultState, hover, focus, fill, disable, error
        
        var labelColor: Color {
            switch self {
                
            case .error:
                return .textDanger
            default:
                return .text100
            }
        }
        
        var textColor: Color {
            switch self {
                
            case .defaultState:
                return .text60
            case .hover:
                return .text60
            case .focus:
                return .text100
            case .fill:
                return .text100
            case .disable:
                return .text60
            case .error:
                return .textDanger
            }
        }
        
        var placeholderColor: Color {
            switch self {
                
            case .defaultState:
                return .text60
            case .hover:
                return .text60
            case .focus:
                return .text100
            case .fill:
                return .text100
            case .disable:
                return .text60
            case .error:
                return .textDanger
            }
        }
        
        var borderColor: Color {
            switch self {
                
            case .defaultState:
                return .stroke40
            case .hover:
                return .stroke60
            case .focus:
                return .strokeFocus
            case .fill:
                return .stroke40
            case .disable:
                return .stroke40
            case .error:
                return .strokeDanger
            }
        }
        
        var hintTextColor: Color {
            switch self {
                
            case .defaultState:
                return .text100
            case .hover:
                return .text60
            case .focus:
                return .text100
            case .fill:
                return .text100
            case .disable:
                return .text60
            case .error:
                return .textDanger
            }
        }
        
        var iconColor: Color {
            switch self {
                
            case .defaultState:
                return .icon60
            case .hover:
                return .icon60
            case .focus:
                return .icon100
            case .fill:
                return .icon100
            case .disable:
                return .icon60
            case .error:
                return .iconDanger
            }
        }
        
        var backgroundColor: Color {
            switch self {
                
            case .disable:
                return .background20
            case .error:
                return .backgroundDanger
            default:
                return .background10Input
            }
        }
    }
    
    @Binding var text: String
    @Binding var label: String
    @Binding var hintText: String
    @Binding var placeholderText: String
    var leftImage: Image?
    var rightImage: Image?
    
    init(text: Binding<String>,
         label: Binding<String>,
         hintText: Binding<String>,
         placeholderText: Binding<String>,
         leftImage: Image? = nil,
         rightImage: Image? = nil) {
        
        self._text = text
        self._label = label
        self._hintText = hintText
        self._placeholderText = placeholderText
        self.leftImage = leftImage
        self.rightImage = rightImage
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            HStack(spacing: .padding4) {
                leftImage
                    .frame(width: 24, height: 24)
                TextField("", text: $text)
                    .background {
                        if text.isEmpty {
                            HStack {
                                Text(placeholderText)
                                Spacer()
                            }
                        }
                    }
                rightImage
                    .frame(width: 24, height: 24)
            }
            .foregroundStyle(.icon60)
                .padding(.all, .padding12)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.stroke40, lineWidth: 1.0)
                }
            Text(hintText)
                .font(.bodyXSmallRegular)
        }
        .font(.bodySmallMedium)
        .foregroundStyle(.text100)
        .padding(.horizontal, 2)    }
}

#Preview {
    @State var text = ""
    return VStack {
        RoundedTextField(text: $text,
                         label: .constant("Label"),
                         hintText: .constant("This is a hint text to help user"),
                         placeholderText: .constant("Placeholder"),
                         leftImage: Image(systemName: "plus.circle"),
                         rightImage: Image(systemName: "plus.circle"))  
        RoundedTextField(text: $text,
                         label: .constant("Label"),
                         hintText: .constant("This is a hint text to help user"),
                         placeholderText: .constant("Placeholder"),
                         leftImage: Image(systemName: "plus.circle"))
        RoundedTextField(text: $text,
                         label: .constant("Label"),
                         hintText: .constant("This is a hint text to help user"),
                         placeholderText: .constant("Placeholder"),
                         rightImage: Image(systemName: "plus.circle"))
        RoundedTextField(text: $text,
                         label: .constant("Label"),
                         hintText: .constant("This is a hint text to help user"),
                         placeholderText: .constant("Placeholder"))
    }
}
