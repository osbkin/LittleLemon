//
//  MenuDishes.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko
//

import SwiftUI
import CoreData

struct MenuDishes: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State var searchText = ""
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            DisplayDishView(dish: dish)
                                .onTapGesture {
                                    viewModel.selectedDish = dish
                                }
                        }
                        .onTapGesture {
                            showAlert.toggle()
                        }
                    }
                    .searchable(text: $searchText, prompt: "search...")
                }
        }
        
        .padding(.top, -10)
        .sheet(isPresented: $viewModel.isShowingDetailView
        ) {
            DetailDishView(dish: viewModel.selectedDish!, isShowingDetailView: $viewModel.isShowingDetailView)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
        // makes the list background invisible, default is gray
        .scrollContentBackground(.hidden)
        
        // runs when the view appears
        .task {
            await dishesModel.reload(viewContext)
        }
    }
    
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "name",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
        
    }
}

struct OurDishes_Previews: PreviewProvider {
    static var previews: some View {
        MenuDishes()
    }
}
