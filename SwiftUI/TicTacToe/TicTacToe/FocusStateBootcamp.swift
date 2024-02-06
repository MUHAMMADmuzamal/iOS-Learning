//
//  FoucsStateBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct FocusStateBootcamp: View {
    @State var userName: String = ""
    @State var password: String = ""
//    @FocusState private var userNameInFocus: Bool
//    @FocusState private var passwordInFocus: Bool
    enum OnboardingFields: Hashable {
        case username
        case password
    }
    @FocusState private var fieldInFocus: OnboardingFields?
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add Your name ...", text: $userName)
//                .focused($userNameInFocus)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
            SecureField("Add Your Password ...", text: $password)
//                .focused($passwordInFocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
            Button("SignUp🚀 ") {
                let userNameIsValid = !userName.isEmpty
                let passwordIsValid = !password.isEmpty
                if userNameIsValid && passwordIsValid {
                    print("Sign up")
                } else if userNameIsValid {
                    fieldInFocus = .password
//                    userNameInFocus = false
//                    passwordInFocus = true
                } else if passwordIsValid {
                    fieldInFocus = .username
//                    userNameInFocus = true
//                    passwordInFocus = false
                }
            }
//            Button("Toggle Focus State") {
//                userNameInFocus.toggle()
//            }
        }
        .padding(14)
    }
}

#Preview {
    FocusStateBootcamp()
}
