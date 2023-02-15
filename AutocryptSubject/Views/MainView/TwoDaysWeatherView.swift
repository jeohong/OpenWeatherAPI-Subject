//
//  TwoDaysWeather.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit
import SnapKit

class TwoDaysWeatherView: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .theme.wetherInfoViewBackground
        
        return stackView
    }()
    
    private let windSpeedLabel: UILabel = {
        let label = UILabel()
        // TODO: 추후 데이터 연결
        label.text = "돌풍의 풍속은 최대 4m/s입니다."
        label.font = .theme.footnote
        label.textColor = .white
        
        return label
    }()
    
    private let divider = Divider()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .theme.wetherInfoViewBackground
        self.layer.cornerRadius = 20
        
        setupStackView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.edges.equalToSuperview().inset(15)
        }
    }
    
    private func setupStackView() {
        [windSpeedLabel, divider].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
}
