//
//  Order.swift
//  Tonis Kitchen
//
//  Created by Grace Carroll on 5/5/21.
//

import Foundation

class Order {
    
    var name: String
    var emailAddress: String
    var phoneNumber: String
    var pickup: String
    var timePickup: String
    var itemOrderArray: [String]
    
    
    var dictionary: [String: Any] {
        return ["name" : name, "emailAddress": emailAddress, "phoneNumber": phoneNumber, "pickup": pickup, "timePickup": timePickup, "itemOrderArray": itemOrderArray]
    }
    
    init(name: String, emailAddress: String, phoneNumber: String, pickup: String, timePickup: String, itemOrderArray: [String]) {
        self.name = name
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.pickup = pickup
        self.timePickup = timePickup
        self.itemOrderArray = itemOrderArray
    }
    
}
