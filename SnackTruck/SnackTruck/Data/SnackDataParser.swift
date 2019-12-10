//
//  SnackDataParser.swift
//  SnackTruck
//
//  Created by Bei, Michelle F on 12/9/19.
//  Copyright © 2019 Bei, Michelle F. All rights reserved.
//

import SwiftUI
import CoreLocation

let snackData: [SnackData] = load("snackListData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    NSLog("File to parse: \(filename)")
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
