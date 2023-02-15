//
//  DailyWeatherTableViewCell.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/16.
//

import UIKit
import SnapKit

class DailyWeatherTableViewCell: UITableViewCell {
    static let identifier = "DailyWeatherTableViewCell"
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .theme.subHeadline
        label.textColor = .white
        
        return label
    }()
    
    let weatherIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let minimumTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightText
        label.font = .theme.subHeadline
        
        return label
    }()
    
    let maximumTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .theme.subHeadline
        
        return label
    }()
    
    let divider = Divider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .theme.wetherInfoViewBackground
        setupLayout()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        
        contentView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(weatherIcon)
        weatherIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        
        contentView.addSubview(maximumTempLabel)
        maximumTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        contentView.addSubview(minimumTempLabel)
        minimumTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(maximumTempLabel.snp.leading).offset(-5)
        }
        
    }
}
