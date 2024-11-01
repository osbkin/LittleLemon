//
//  TextFieldView.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-01.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textField: String
    @State var title: String
    @State var placeholderText: String
    @State var isFocused: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)

            TextField(placeholderText, text: $textField) { isFocused in
                self.isFocused = isFocused
            }
            .padding()
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(isFocused ? .primaryGreen : .gray3)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? .primaryGreen : .gray2, style: StrokeStyle(lineWidth: 2))
                )
            .autocorrectionDisabled()
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}

#Preview {
    TextFieldView(textField: .constant("Olha"), title: "First Name", placeholderText: "Enter your first name")
}
