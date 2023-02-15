//
//  TwoDaysWeather.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit
import SnapKit

class TwoDaysWeatherView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .theme.wetherInfoViewBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
