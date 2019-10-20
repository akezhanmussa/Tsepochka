//
//  Category.swift
//  Tsepochka
//
//  Created by Galym Anuarbek on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation

class Category: NSObject {
    var name: String
    var sources: [String]
    
    init(name: String, sources: [String]) {
        self.name = name
        self.sources = sources
    }
}
