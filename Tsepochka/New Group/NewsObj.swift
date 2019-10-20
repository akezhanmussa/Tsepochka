//
//  NewsObj.swift
//  Tsepochka
//
//  Created by Galym Anuarbek on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class News: NSObject {
    
    var title: String
    var text: String
    var textHref: String
    var source: String
    var imgLink: String
    var href: String
    var data: String
    
    class func showNews(forCategories: [Category], completion: @escaping([News]) -> Swift.Void) {
        var allNews: [News] = []
        var categoryNames: [String] = []
        for category in forCategories {
            categoryNames.append(category.name)
        }
        Database.database().reference().child("news").observe(.childAdded) { (snapshot) in
            if categoryNames.contains(snapshot.key) {
                if let thisCategory = snapshot.value as? [String: Any] {
                    for news in thisCategory {
                    }
                }
            }
        }
        DispatchQueue.main.async {
            completion(allNews)
        }
    }
    
    init(title: String, text: String, textHref: String, source: String, imgLink: String, href: String, data: String) {
        self.title = title
        self.text = text
        self.textHref = textHref
        self.source = source
        self.imgLink = imgLink
        self.href = href
        self.data = data
    }
    
}
