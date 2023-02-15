//
//  WeatherCollectionViewCell.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/15.
//

import UIKit
import SnapKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherCollectionViewCell"

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .theme.footnote
        label.textColor = .white
        label.text = "지금"
        label.sizeToFit()
        
        return label
    }()
    
    let weatherIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .theme.footnote
        label.textColor = .white
        label.text = "7º"
        label.sizeToFit()
        
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
        self.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.addSubview(weatherIcon)
        weatherIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(5)
            make.height.width.equalTo(40)
        }
        
        self.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherIcon.snp.bottom).offset(5)
        }
    }
    
    func getContentHeight() -> Double {
        let timeLabelHeight = timeLabel.frame.height
        let temperatureLabelHeight = temperatureLabel.frame.height
        
        let labelsHeights = timeLabelHeight + temperatureLabelHeight
        
        return Double(labelsHeights) + 60
    }
}
