//
//  SnackData.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI

struct SnackData : Identifiable, Codable, Hashable {
    var id : Int
    var name : String
    var snackType : SnackType
}

enum SnackType : String, Codable, Hashable, CaseIterable {
    case veggie = "Veggie"
    case nonVeggie = "Non-Veggie"
}
