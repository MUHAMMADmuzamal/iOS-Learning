//
//  ModalAlert.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

struct CustomAlertModel {
    let title: String
    let message: String
    let primaryButtonTitle: String
    let primaryAction: () -> Void
    let secondaryButtonTitle: String?
    let secondaryAction: (() -> Void)?
}

struct ModelAlert: View {
    let model: CustomAlertModel
    @Binding var isPresented: Bool
    
    var body: some View {
        if isPresented {
            VStack(spacing: 20) {
                Text(model.title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(model.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                HStack {
                    if let secondaryTitle = model.secondaryButtonTitle, let secondaryAction = model.secondaryAction {
                        Button(secondaryTitle) {
                            isPresented = false
                            secondaryAction()
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    Button(model.primaryButtonTitle) {
                        isPresented = false
                        model.primaryAction()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .padding(.horizontal, 20)
        }
    }
}

struct ModelAlertModifier: ViewModifier {
        @Binding var isPresented: Bool
        let model: CustomAlertModel
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                ModelAlert(model: model, isPresented: $isPresented)
            }
        }
    }
}

extension View {
    func modelAlert(isPresented: Binding<Bool>, model: CustomAlertModel) -> some View {
        self.modifier(ModelAlertModifier(isPresented: isPresented, model: model))
    }
}

#Preview {
    ModelAlert(model: CustomAlertModel(
        title: "Error",
        message: "Something went wrong!",
        primaryButtonTitle: "OK",
        primaryAction: { print("OK Pressed") },
        secondaryButtonTitle: "Cancel",
        secondaryAction: { print("Cancel Pressed") }
    ), isPresented: .constant(true))
}

