//
//  MessageTextField.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/06/2025.
//

import SwiftUI

struct MessageTextField: View {
    @Binding var text: String
    var body: some View {
        TextField("Type message", text: $text, axis: .vertical)
            .submitLabel(.go)
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
            .padding(.all, .padding12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.background20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.neutral20, lineWidth: 1.0)
                    }
            }
            .onSubmit {
                print("Go pressed with value: \(text)")
            }
    }
}

#Preview {
    MessageTextField(text: .constant("adfad\ndfafasdfasdf\nfadfswerqewerqwrqwerdfahdfkhakhfhakdshfkhasdfhaiurhiewriqweirqweofidsofoadofpiafipdsifpaposdjkcjvlsjvdsoufofjdsfooqwejdsjforoqewurodjfjadsfqwerpouqru0q0dfojasdjdsvnsafpfuqweufdjf"))
        .padding(50)
}
