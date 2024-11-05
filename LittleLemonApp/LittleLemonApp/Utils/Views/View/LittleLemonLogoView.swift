//
//  LittleLemonLogo.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-10-30.
//

import SwiftUI

struct LittleLemonLogoView: View {
    var body: some View {
        Image("littleLemonLogo")
            .resizable()
            .scaledToFill()
            .padding(20)
    }
}

#Preview {
    LittleLemonLogoView()
}
