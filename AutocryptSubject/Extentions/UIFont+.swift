//
//  UIFont+.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/13.
//

import UIKit

extension UIFont {
    static let theme = FontStyle()
}

struct FontStyle {
    let title1 = UIFont.systemFont(ofSize: 90, weight: .regular)
    let title2 = UIFont.systemFont(ofSize: 40, weight: .regular)
    let title3 = UIFont.systemFont(ofSize: 30, weight: .regular)
    let headline = UIFont.systemFont(ofSize: 20, weight: .regular)
    let subHeadline = UIFont.systemFont(ofSize: 16, weight: .regular)
    let footnote = UIFont.systemFont(ofSize: 12, weight: .regular)
    let caption1 = UIFont.systemFont(ofSize: 10, weight: .bold)
    let caption2 = UIFont.systemFont(ofSize: 8, weight: .regular)
}
