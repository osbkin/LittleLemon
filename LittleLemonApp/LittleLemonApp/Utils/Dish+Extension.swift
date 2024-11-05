//
//  Dish+Extension.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-05.
//

import Foundation
import CoreData


extension Dish {
    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        menuItems.forEach { item in
            
            let dish = Dish(context: context)
            dish.name = item.title
            dish.price = Float(item.price)!
            dish.category = item.category
            dish.image = item.image
            dish.descriptionDish = item.description
        }
        Dish.saveDatabase(context)
    }
    
    class func saveDatabase(_ context: NSManagedObjectContext) {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
