//
//  SnackData.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

// SnackData holds information for each snack
struct SnackData : Identifiable, Codable, Hashable {
    var id : Int
    var name : String
    var snackType : SnackType
    
    init(id: Int, name: String, snackType: SnackType) {
        self.id = id
        self.name = name
        self.snackType = snackType
    }
    
    init(snack: SnackData) {
        self.id = snack.id
        self.name = snack.name
        self.snackType = snack.snackType
    }
    
    static func == (lhs: SnackData, rhs: SnackData) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum SnackType : String, Codable, Hashable, CaseIterable {
    case veggie = "Veggie"
    case nonVeggie = "Non-Veggie"
}
