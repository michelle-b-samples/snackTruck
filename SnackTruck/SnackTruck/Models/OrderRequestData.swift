//
//  OrderRequestData.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

// OrderRequestList is a singleton that keeps track of the current order
let orderRequestList = OrderRequestList()

class OrderRequestList {
    var orderList = Set<OrderRequestData>()
    
    public func resetOrderRequest() {
        orderList.removeAll()
    }
    
    public func removeItem(itemName : String) {
        NSLog("Removing order request for item \(itemName)")
    }
    
    public func insertItem(itemName : String) {
        NSLog("Inserting order request for item \(itemName)")
    }
}

// OrderRequestData holds specific information about the items
// being requested. Created this struct to be able to hold
// future data like the possibility of adding amounts of each item
// or possible modifications to the item.
struct OrderRequestData: Hashable {
    var id: Int
    var itemName : String
}
