//
//  DetailDishView.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import SwiftUI


struct DetailDishView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let dish: Dish
    @State private var showAlert = false
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 120)
            
            Text(dish.name ?? "")
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundColor(.white)
                .background(.primaryGreen)
            
            Group {
                Text(dish.descriptionDish ?? "")
                Text(dish.formatPrice())
                    .font(.title)
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            
            Button {
                showAlert.toggle()
            } label: {
                YellowButtonFilledStyle(title: "Add to your order")
                    .padding(.horizontal, 60)
            }
            
            .alert("\(dish.name ?? "Dish") was added to your order, thanks!",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
                   .frame(maxWidth: .infinity)
                   .ignoresSafeArea()
            Spacer()
        }
    }
}

struct DividerView: View {
    var body: some View {
        Divider()
            .background()
            .padding()
    }
}

#Preview {
    DetailDishView(dish: PersistenceController.oneDish(), isShowingDetailView: .constant(false))
}
