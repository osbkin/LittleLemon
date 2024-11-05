//
//  CheckBoxView.swift
//  LittleLemonApp
//
//

import SwiftUI

struct CheckBoxView: View {
    @State private var isChecked: Bool = false
    @State var itemText: String
    
    var body: some View {
        VStack {
            Toggle(isOn: $isChecked) {
                Text(itemText)
            }
            .toggleStyle(CheckboxToggleStyle())
        }
    }
}

// Define a custom toggle style to make our Toggle look like a checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(configuration.isOn ?  Color.primaryGreen : Color.white)
                    .frame(width: 30, height:30, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(configuration.isOn ? Color.primaryGreen : Color.gray1, lineWidth: 2)
                    }
                   
                Image(systemName: configuration.isOn ? "checkmark" : "")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .onTapGesture { configuration.isOn.toggle() }
            }
            configuration.label
                .font(.footnote)
                .foregroundColor(.gray3)
            Spacer()
        }
    }
}


#Preview {
    CheckBoxView(itemText: "Text description here")
}
