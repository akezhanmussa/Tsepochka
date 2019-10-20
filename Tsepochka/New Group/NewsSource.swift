//
//  NewsSource.swift
//  Tsepochka
//
//  Created by Galym Anuarbek on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation

class NewsSource: NSObject {
    var name: String
    var href: String
    
    init(name: String, href: String) {
        self.name = name
        self.href = href
    }
}
