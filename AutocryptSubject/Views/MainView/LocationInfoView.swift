//
//  LocationInfoView.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit
import SnapKit

class LocationInfoView: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        
        return stackView
    }()
    
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
        
        setupStackView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.bottom.centerX.equalToSuperview()
        }
    }
    
    private func setupStackView() {
        [locationLabel, temperatureLabel, climateLabel, todayTemperatureLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.setCustomSpacing(0, after: climateLabel)
    }
}
