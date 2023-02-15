//
//  FiveDaysWeatherView.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/16.
//

import UIKit
import SnapKit

class FiveDaysWeatherView: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.backgroundColor = .theme.wetherInfoViewBackground
        
        return stackView
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "5일간의 일기예보"
        label.font = .theme.footnote
        label.textColor = .white
        
        return label
    }()
    
    private lazy var dailyWeatherTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        
        tableView.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: DailyWeatherTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
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
        [informationLabel, divider, dailyWeatherTableView].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        dailyWeatherTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(DailyWeatherTableViewCell().frame.height * 5 + 5)
            make.width.equalTo(divider)
        }
        
        divider.isHidden = true
    }
}

extension FiveDaysWeatherView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? DailyWeatherTableViewCell {
            // TODO: 데이터연결
            cell.dayLabel.text = "월요일"
            cell.weatherIcon.image = UIImage(named: "01d")
            cell.minimumTempLabel.text = "최소:-7º"
            cell.maximumTempLabel.text = "최대:-7º"
        }
        
        return cell
    }
}
