//
//  Student.swift
//  StudentPut_iOS14
//
//  Created by Kaitlyn Barker on 8/2/17.
//  Copyright © 2017 Kaitlyn Barker. All rights reserved.
//

import Foundation

struct Student {
    let name: String
}

extension Student {
    
    private static var nameKey: String { return "name" }
    
    init?(dictionary: [String:Any]) {
        guard let name = dictionary[Student.nameKey] as? String else { return nil }
        
        self.name = name
    }
    
    var dictionaryRepresentation: [String:Any] {
        return [Student.nameKey: self.name]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}

// the reason why we are doing "try?" instead of do-try-catch is because we don't really care if we get data back, we can just send empty data. we dont care about errors. we can get nil and not worry about it.
