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
    
    private lazy var weatherCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
        
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
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
        [windSpeedLabel, divider, weatherCollectionView].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        weatherCollectionView.snp.makeConstraints { make in
            make.width.equalTo(divider)
            make.height.equalTo(WeatherCollectionViewCell().getContentHeight())
        }
    }
}

extension TwoDaysWeatherView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 48 / 3 + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath)
        
        if let cell = cell as? WeatherCollectionViewCell {
            cell.timeLabel.text = "지금"
            cell.weatherIcon.image = UIImage(named: "01d")
            cell.temperatureLabel.text = "7º"
        }
                
        return cell
    }
}

extension TwoDaysWeatherView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width / 7, height: collectionView.frame.height)
    }
}
