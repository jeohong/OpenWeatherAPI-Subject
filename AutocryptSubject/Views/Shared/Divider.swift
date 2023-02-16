//
//  Divider.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit

class Divider: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGray2
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: (window?.windowScene?.screen.bounds.width ?? 0) - 60, height: 1)
    }
}
