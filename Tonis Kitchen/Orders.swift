//
//  Orders.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/12/21.
//

import Foundation
import Firebase

class Orders {
    var orderArray: [Order] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ()) {
        db.collection("orders").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.orderArray = []
            for document in querySnapshot!.documents {
                let order = Order(dictionary: document.data())
                order.documentID = document.documentID
                self.orderArray.append(order)
            }
            completed()
        }
    }
}
