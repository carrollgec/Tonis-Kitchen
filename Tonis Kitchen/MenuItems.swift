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
