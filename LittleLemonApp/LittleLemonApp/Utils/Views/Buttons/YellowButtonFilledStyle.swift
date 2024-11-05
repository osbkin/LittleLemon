//
//  YellowButtonFilledStyle.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import SwiftUI

struct YellowButtonFilledStyle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: 50)
            .foregroundStyle(.gray3)
            .background(.secondaryYellow, in: Capsule())
            .padding(.top, 12)
            .padding(.bottom, 24)
    }
}

#Preview {
    YellowButtonFilledStyle(title: "Text title")
}
