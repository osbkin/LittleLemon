//
//  GreenButtonFilledStyle.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import SwiftUI

struct GreenButtonFilledStyle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .foregroundStyle(.white)
            .background(.primaryGreen, in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    GreenButtonFilledStyle(title: "Text title")
}
