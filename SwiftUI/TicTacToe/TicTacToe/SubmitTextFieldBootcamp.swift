//
//  SubmitTextFieldBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct SubmitTextFieldBootcamp: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            TextField("Add text..", text: $text)
                .submitLabel(.continue)
                .onSubmit {
                    print(text)
                }
            TextField("Add text1..", text: $text)
                .submitLabel(.send)
                .onSubmit {
                    print(text)
                }
            TextField("Add text1..", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print(text)
                }
        }
            
    }
}

#Preview {
    SubmitTextFieldBootcamp()
}
