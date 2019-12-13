//
//  OrderRequestList.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

/* OrderRequestList - Contains an environment object that holds a set
    of selected SnackData and actions that modify list objects.
   
    orderList - Contains list of user selected items.
        Note: This is intended to hold additional information for each SnackData item,
            such as item count if app were to extend its functionality in that fashion.
*/
class OrderRequestList : ObservableObject {
    @Published var orderList : Set<SnackData> = []
    
    func addItem(snack: SnackData) {
        NSLog("Add item to order list: \(snack.name)")
        orderList.insert(SnackData(snack: snack))
    }

    func removeItem(snack: SnackData) {
        NSLog("Remove item from order list: \(snack.name)")
        orderList.remove(SnackData(snack: snack))
    }

    func isItemOrdered(snack: SnackData) -> Bool {
        return orderList.contains(SnackData(snack: snack))
    }

    func resetOrderList() {
        NSLog("Clear order list")
        orderList.removeAll()
    }
}
