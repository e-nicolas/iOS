//
//  UIColorExtension.swift
//  IntegraApp
//
//  Created by Emmanouil Nicolas Papadimitropoulos on 12/13/16.
//  Copyright © 2016 Netpoint. All rights reserved.
//

import Foundation

extension UIColor {
    func hexString() -> String {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format: "#%06x", rgb) as String
    }
}
