//
//  LocationInfoView.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit
import SnapKit

class LocationInfoView: UIView {
    private let locationLabel: UILabel = {
        let label = UILabel()
        // TODO: 추후 데이터 연결
        label.text = "Seoul"
        label.textColor = .white
        label.font = .theme.title2
        
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        // TODO: 추후 데이터 연결
        label.text = "-7º"
        label.textColor = .white
        label.font = .theme.title1
        
        return label
    }()
    
    private let climateLabel: UILabel = {
        let label = UILabel()
        // TODO: 추후 데이터 연결
        label.text = "맑음"
        label.textColor = .white
        label.font = .theme.title3
        
        return label
    }()
    
    private let todayTemperatureLabel: UILabel = {
        let label = UILabel()
        // TODO: 추후 데이터 연결
        label.text = "최고: -1º | 최저: -11º"
        label.textColor = .white
        label.font = .theme.headline

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalToSuperview()
        }
        
        self.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
        }
        
        self.addSubview(climateLabel)
        climateLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(temperatureLabel.snp.bottom).offset(5)
        }
        
        self.addSubview(todayTemperatureLabel)
        todayTemperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(climateLabel.snp.bottom)
        }
    }
}
