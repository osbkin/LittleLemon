//
// DisplayDish.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import SwiftUI

struct DisplayDishView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let dish: Dish
    
    var body: some View {        
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(dish.name ?? "")
                    .font(.headline)
    
                Text(dish.descriptionDish ?? "")
                    .font(.caption)
                
                Text(dish.formatPrice())
                    .font(.headline)
            }
            .padding([.top, .bottom], 8)
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 8))
            } placeholder: {
                    ProgressView()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    DisplayDishView(dish: PersistenceController.oneDish())
}
