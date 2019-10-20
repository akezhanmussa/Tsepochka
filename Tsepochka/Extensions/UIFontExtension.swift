//
//  UIFontExtension.swift
//  Tsepochka
//
//  Created by Daulet Kenzhetayev on 12/24/17.
//  Copyright © 2017 mad. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func SFMedium(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: ".SFUIText-Medium", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
    
}
