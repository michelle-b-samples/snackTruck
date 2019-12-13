//
//  SnackListView.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

/*
 SnackListView
 Main app view that combines all individual view elements.
 */
struct SnackListView: View {
    @EnvironmentObject var itemsSelected : OrderRequestList
    @State var showOrderView = false
    @State var showOperatorView = false
    @State var showVeggies = true
    @State var showNonVeggies = true
    
    // Filters SnackData based on showVeggie and showNonVeggie toggles
    var filteredMenu: [SnackData] {
        return snackData.filter({ (item) -> Bool in
            return ((self.showVeggies && item.snackType == SnackType.veggie) ||
                    (self.showNonVeggies && item.snackType == SnackType.nonVeggie))
        })
    }
    
    var body: some View {
            VStack {
                HStack(alignment: .top) {
                    Text("SnackTruck")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    VStack {
                        Text("Veggie")
                            .font(.headline)
                            .foregroundColor(Color.green)
                        Toggle("Veggie", isOn: $showVeggies)
                            .labelsHidden()
                    }
                    .padding(.horizontal, 25)
                    
                    VStack {
                        Text("Non-Veggie")
                            .font(.headline)
                            .foregroundColor(Color.red)
                        Toggle("Non-Veggie", isOn: $showNonVeggies)
                            .labelsHidden()
                    }
                    .padding(.horizontal, 25)
                }
                
                // Creates a list of SnackItemView and handles the addition/removal of snack items to the order list
                List {
                    ForEach(filteredMenu) { snack in
                        SnackItemView(snackItem: snack, isItemSelected: self.itemsSelected.isItemOrdered(snack: snack)) {
                            if (self.itemsSelected.isItemOrdered(snack: snack)) {
                                self.itemsSelected.removeItem(snack: snack)
                            }
                            else {
                                self.itemsSelected.addItem(snack: snack)
                            }
                        }
                    }
                }
    
                    
                // Adds a footer to the table view to remove extra divider lines
                // introduced by List
                .onAppear{
                    UITableView.appearance().tableFooterView = UIView()
                }
                
                HStack {
                    Button(action: {self.showOrderView = true}) {
                        HStack {
                            Text("Submit")
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                        }
                        .padding()
                    }
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                    .sheet(isPresented: $showOrderView) {
                        OrderConfirmationView(showModal: self.$showOrderView, showVeggies: self.$showVeggies, showNonVeggies: self.$showNonVeggies)
                            .environmentObject(self.itemsSelected)
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
}

//struct SnackListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnackListView(appState)
//    }
//}
