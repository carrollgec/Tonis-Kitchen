//
//  Order.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/5/21.
//

import Foundation
import Firebase

class Order: NSObject {
    
    var postingUserID: String
    var name: String
    var emailAddress: String
    var phoneNumber: String
    var pickup: String
    var notes: String
    var itemOrderArray: [String]
    var documentID: String
    
    
    var dictionary: [String: Any] {
        return ["postingUserID": postingUserID,"name" : name, "emailAddress": emailAddress, "phoneNumber": phoneNumber, "pickup": pickup, "notes": notes, "itemOrderArray": itemOrderArray]
    }
    
    init(postingUserID: String, name: String, emailAddress: String, phoneNumber: String, pickup: String, notes: String, itemOrderArray: [String], documentID: String) {
        self.postingUserID = postingUserID
        self.name = name
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.pickup = pickup
        self.notes = notes
        self.itemOrderArray = itemOrderArray
        self.documentID = documentID
    }
    
    convenience override init() {
        self.init(postingUserID: "", name: "", emailAddress: "", phoneNumber: "", pickup: "", notes: "", itemOrderArray: [""], documentID: "")
    }
    
    convenience init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        let emailAddress = dictionary["emailAddress"] as! String? ?? ""
        let phoneNumber = dictionary["phoneNumber"] as! String? ?? ""
        let pickup = dictionary["pickup"] as! String? ?? ""
        let notes = dictionary["notes"] as! String? ?? ""
        let itemOrderArray = dictionary["itemOrderArray"] as! [String]? ?? [""]
        self.init(postingUserID: postingUserID, name: name, emailAddress: emailAddress, phoneNumber: phoneNumber, pickup: pickup, notes: notes, itemOrderArray: itemOrderArray, documentID: "")
    }
    
    func saveData(completion: @escaping (Bool) -> ()){
        let db = Firestore.firestore()
        guard let postingUserID = Auth.auth().currentUser?.uid else {
            print("ERROR: COuld not save data because there is not a valid postingUserID")
            return completion(false)
        }
        self.postingUserID = postingUserID
        let dataToSave: [String: Any] = self.dictionary
        if self.documentID == "" {
            var ref: DocumentReference? = nil
            ref = db.collection("orders").addDocument(data: dataToSave){ (error) in
                guard error == nil else {
                    print("ERROR: adding document \(error!.localizedDescription)")
                    return completion(false)
                }
                self.documentID = ref!.documentID
                print("Added document: \(self.documentID)")
                completion(true)
            }
        } else {
            let ref = db.collection("orders").document(self.documentID)
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
