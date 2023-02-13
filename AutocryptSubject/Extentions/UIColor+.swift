//
//  UIColor+.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/13.
//

import UIKit

extension UIColor {
    static let theme = ColorTheme()
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
                
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

struct ColorTheme {
    let searchViewBackground = UIColor(hexCode: "46699A")
    let mainViewBackground = UIColor(hexCode: "6A92C4")
    let wetherInfoViewBackground = UIColor(hexCode: "4C7DBC")
    let searchBarBackground = UIColor(hexCode: "97B3D6")
}
