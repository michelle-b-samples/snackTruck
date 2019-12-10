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
    @State var itemsSelected = Set<String>()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Snack Attack Menu")
                        .font(.title)
                }
                .frame(alignment: .top)
                
                HStack {
                    Spacer()
                    Text("Veggie")
                        .font(.headline)
                        .foregroundColor(Color.green)
                    Spacer()
                    Text("Non-Veggie")
                        .font(.headline)
                        .foregroundColor(Color.red)
                    Spacer()
                }
        //            ScrollView(.vertical, showsIndicators: true) {
        //                VStack {
        //                    ForEach(snackData) { snack in
        //                        SnackItemView(snackItem: snack)}
        //                }
        //            }
                
                // Creates a list of SnackItemView
                List {
                    ForEach(snackData) { snack in
                        SnackItemView(snackItem: snack)
                    }
                }
                    
                // Adds a footer to the table view to remove extra divider lines
                // introduced by List
                .onAppear{
                    UITableView.appearance().tableFooterView = UIView()
                }
                
                HStack {
                    Text("Submit")
                        .font(.headline)
                    
                    //NavigationLink(destination: )
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct SnackListView_Previews: PreviewProvider {
    static var previews: some View {
        SnackListView()
    }
}
