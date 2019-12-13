//
//  OrderConfirmationView.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/10/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

/* OrderConfirmationView - Modal that handles the order submission
    Use cases handled:
        1. Successful order (orderList was properly sent to and received by the service)
            - Shows "Order Confirmed" text and a list of ordered items
            - Shows clickable "Done" button to return to the root view
                - This will also reset the states of the root view
        2. No items selected
            - Shows "Cart is empty" text
            - Shows clickable "Done" button to return to the root view
                - Does not reset any states of the root view
        3. Unsuccessful order (orderList was not properly sent or received by the service)
            - Shows "Order error occurred. Please consult SnackTruck associate." text
            - Shows clickable "Done" button to return to the root view
                - This will not reset any states of the root view
*/
struct OrderConfirmationView: View {
    @EnvironmentObject var itemsSelected : OrderRequestList
    @Binding var showModal : Bool
    @Binding var showVeggies : Bool
    @Binding var showNonVeggies : Bool
    
    var orderHandler = OrderRequestHandler()
    
    var body: some View {
        VStack {
            Spacer()
            if (itemsSelected.orderList.count == 0) {
                Text("Cart is empty")
                    .font(.headline)
                Spacer()
                Button("Done") {
                    self.showModal = false
                }
            }
            else {
                if (orderHandler.submitOrder(selectedItems: itemsSelected.orderList)) {
                    Group {
                    Text("Order Confirmed")
                        .font(.largeTitle)
                        .foregroundColor(Color.green)
                        .bold()
            
                    ForEach(orderHandler.getConfirmedOrder()) { item in
                        Text(item.name)
                    }
                    }
                }
                else {
                    Text("Order error occurred. Please consult SnackTruck associate.")
                        .font(.headline)
                        .foregroundColor(Color.red)
                }
                
                Spacer()
                Button("Done") {
                    self.showModal = false
                    self.showVeggies = true
                    self.showNonVeggies = true
                    self.itemsSelected.resetOrderList()
                }
            }
        }
    }
}

//struct OrderConfirmationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderConfirmationView(showModal: .constant(true))
//    }
//}
