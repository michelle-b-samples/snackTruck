//
//  OrderRequestHandler.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/10/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import Foundation

/*
    OrderRequestHandler - Handles order submission to the service
    Notes: This is intended to handle the sending and receiving of the
        order data to the SnackTruck ordering service. To simulate the
        callback from the service, I decode the created JSON from the
        order list as to pretend that its data being received. This
        is what is being displayed in the OrderConfirmationView in the
        success case.
 
    send() - This function can be manipulated to show the error case in
        OrderConfirmationView by changing success to false.
 
    getConfirmedOrder() - Returns the parsed SnackData list in a successful
        order
*/
class OrderRequestHandler {
    var confirmedOrder : [SnackData]
    
    init() {
        confirmedOrder = []
    }
    
    /* submitOrder - Submits an order to the service
       Returns
          false - createOrderData was not created or send was unsuccessful
          true - orderData was sent to ordering service successfully
   */
    public func submitOrder(selectedItems: Set<SnackData>) -> Bool {
        var orderSuccess : Bool = false
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let orderData = try? encoder.encode(selectedItems) else {
            return orderSuccess;
        }
        
        // Send data ordering service
        orderSuccess = send(data: orderData)
        
        if let itemListString = String(data: orderData, encoding: .utf8) {
            NSLog("Ordered Items in JSON format: \(itemListString)")
        }
        
        return orderSuccess;
    }
    
    public func getConfirmedOrder() -> [SnackData] {
        return confirmedOrder
    }
    
    // TODO: Remove once send function has been defined/built
    private func send(data : Data) -> Bool {
        // Change this value to toggle Confirmation view between success case vs error
        let success = true
        
        // This represents the stubbed order confirmation from service
        if (success) {
            confirmedOrder = load(data)
        }
        return success
    }
}
