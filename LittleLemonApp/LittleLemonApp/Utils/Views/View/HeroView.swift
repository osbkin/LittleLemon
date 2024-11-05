//
//  HeroView.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-10-30.
//

import SwiftUI

struct HeroView: View {
    private var isRegistered: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.primaryGreen)
                .frame(minHeight: 335, maxHeight: 350)
                
            VStack(alignment: .leading, spacing: 8) {
                Text("Litte Lemon")
                    .font(.system(size: 64))
                    .fontWeight(.medium)
                    .foregroundColor(.secondaryYellow)
                Text("Chicago")
                    .font(.largeTitle)
                    .foregroundColor(.gray0)
                    .padding(.bottom, 4)
                
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.title3)
                        .foregroundColor(.gray0)
                    Image("HeroImage")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(16)
                }
                
                // Show the button in case if the user registered
//                if isRegistered {
//                    Button {}
//                     label: {
//                        Text("Reserve A Table")
//                            .fontWeight(.bold)
//                    }
//                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
//                    .foregroundStyle(.gray3)
//                    .background(.secondaryYellow, in: Capsule())
//                }
            }
            .padding(16)
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    HeroView()
}
