//
//  MenuItem.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/13/21.
//

import Foundation
import Firebase

class MenuItem {
    
    var item: String
    var menuItemImage: String
    var description: String
    var allergyInfo: String
    var ingredients: String
    var quantity: Double
    var metric: String
    var isSelected: Bool
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["item": item, "menuItemImage": menuItemImage, "description": description, "allergyInfo": allergyInfo, "ingredients": ingredients, "quantity": quantity, "metric": metric, "isSelected": isSelected]
    }
    
    init(item: String, menuItemImage: String, description: String, allergyInfo: String, ingredients: String, quantity: Double, metric: String, isSelected: Bool, documentID: String) {
        self.item = item
        self.menuItemImage = menuItemImage
        self.description = description
        self.allergyInfo = allergyInfo
        self.ingredients = ingredients
        self.quantity = quantity
        self.metric = metric
        self.isSelected = isSelected
        self.documentID = documentID
    }
    
    convenience init() {
        self.init(item: "", menuItemImage: "", description: "", allergyInfo: "", ingredients: "", quantity: 0, metric: "", isSelected: false, documentID: "")
    }
    
    convenience init(dictionary: [String: Any]) {
        let item = dictionary["item"] as! String? ?? ""
        let menuItemImage = dictionary["menuItemImage"] as! String? ?? ""
        let description = dictionary["description"] as! String? ?? ""
        let allergyInfo = dictionary["allergyInfo"] as! String? ?? ""
        let ingredients = dictionary["ingredients"] as! String? ?? ""
        let quantity = dictionary["quantity"] as! Double? ?? 0.0
        let metric = dictionary["metric"] as! String? ?? ""
        let isSelected = dictionary["isSelected"] as! Bool? ?? false
        self.init(item: item, menuItemImage: menuItemImage, description: description, allergyInfo: allergyInfo, ingredients: ingredients, quantity: quantity, metric: metric, isSelected: isSelected, documentID: "")
    }
    
    func saveData(completion: @escaping (Bool) -> ()){
        let db = Firestore.firestore()
//        guard let postingUserID = Auth.auth().currentUser?.uid else {
//            print("ERROR: COuld not save data because there is not a valid postingUserID")
//            return completion(false)
//        }
//        self.postingUserID = postingUserID
        let dataToSave: [String: Any] = self.dictionary
        if self.documentID == "" {
            var ref: DocumentReference? = nil
            ref = db.collection("menu").addDocument(data: dataToSave){ (error) in
                guard error == nil else {
                    print("ERROR: adding document \(error!.localizedDescription)")
                    return completion(false)
                }
                self.documentID = ref!.documentID
                print("Added document: \(self.documentID)")
                completion(true)
            }
        } else {
            let ref = db.collection("menu").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                guard error == nil else {
                    print("ERROR: updating document \(error!.localizedDescription)")
                    return completion(false)
                }
                print("Updated document: \(self.documentID)")
                completion(true)
            }
        }
    }
    
}
