//
//  MenuItems.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/13/21.
//

import Foundation
import Firebase

class MenuItems {
    
    var menuItemArray: [MenuItem] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func populateMenu() {
        let item1 = MenuItem(item: "Apple", menuItemImage: "", description: "Sweet red fruit with lots of vitamins", allergyInfo: "N/A", ingredients: "N/A", quantity: 0, metric: "1 Whole Fruit", isSelected: false, documentID: "")
        let item2 = MenuItem(item: "Pasta", menuItemImage: "", description: "Nutritious grain food. Comes in rotini or penne.", allergyInfo: "Contains: gluten", ingredients: "Flour, egg, water", quantity: 0, metric: "1 Pound", isSelected: false, documentID: "")
        let item3 = MenuItem(item: "Eggplant Parmesean", menuItemImage: "", description: "Fried eggplant slices with cheese and marinara sauce.", allergyInfo: "Contains: dairy, gluten.", ingredients: "Eggplant, breadcrumbs, cheese, tomatoes", quantity: 0, metric: "1 Meal", isSelected: false, documentID: "")
        let item4 = MenuItem(item: "Fresh Bread", menuItemImage: "", description: "Freshly baked sourdough bread.", allergyInfo: "Contains: gluten", ingredients: "Flour, water, yeast", quantity: 0, metric: "1 Loaf or Bag", isSelected: false, documentID: "")
        menuItemArray.append(item1)
        menuItemArray.append(item2)
        menuItemArray.append(item3)
        menuItemArray.append(item4)
    }
    
    func loadData(completed: @escaping () -> ()) {
        db.collection("menu").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.menuItemArray = []
            for document in querySnapshot!.documents {
                let menuItem = MenuItem(dictionary: document.data())
                menuItem.documentID = document.documentID
                self.menuItemArray.append(menuItem)
            }
            completed()
        }
    }
}
