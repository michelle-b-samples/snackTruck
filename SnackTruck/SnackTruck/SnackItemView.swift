//
//  SnackItemView.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

/*
    SnackItemView - View that contains the checkbox and item name for each
        SnackData item. Handles the coloring of item name based on snackType and
        manages the checkbox images.
 */
struct SnackItemView: View {
    var snackItem : SnackData
    var isItemSelected : Bool
    var action: () -> Void
    
    var body: some View {
        
        Button(action: self.action) {
            HStack {
                // Creates a checkbox
                Image(systemName: (isItemSelected ? "checkmark.square" : "square"))
                
                Text(snackItem.name)
                .foregroundColor((snackItem.snackType == SnackType.veggie) ? Color.green : Color.red)
                .fontWeight(isItemSelected ? .medium : .regular)
                .font(.body)
            }
        }
    }
}

//struct SnackItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SnackItemView(snackItem: snackData[0])
//            SnackItemView(snackItem: snackData[1])
//        }
//    }
//}
