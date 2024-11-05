//
//  XDismissButton.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetailView.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.gray3)
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding([.trailing, .top], 20)
    }
}

#Preview {
    XDismissButton(isShowingDetailView: .constant(false))
}
