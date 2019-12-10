//
//  SnackItemView.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

struct SnackItemView: View {
    @State var isItemSelected : Bool = false
    var snackItem : SnackData
    
    private func toggle() {
        isItemSelected = !isItemSelected
        if (isItemSelected) {
            orderRequestList.insertItem(itemName: snackItem.name)
        }
        else {
            orderRequestList.removeItem(itemName: snackItem.name)
        }
    }
    
    var body: some View {
        HStack {
            // Creates a checkbox
            Button(action: toggle) {
                Image(systemName: isItemSelected ? "checkmark.square" : "square")
            }
            
            if (snackItem.snackType == SnackType.veggie) {
                // Green text if item is veggie
                Text(snackItem.name)
                    .foregroundColor(Color.green)
            }
            else if (snackItem.snackType == SnackType.nonVeggie) {
                // Red text if item is non-veggie
                Text(snackItem.name)
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct SnackItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SnackItemView(snackItem: snackData[0])
            SnackItemView(snackItem: snackData[1])
        }
    }
}
