//
//  MainViewController.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/13.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    // Component
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"

        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .theme.searchBarBackground

            let tapped = UITapGestureRecognizer(target: self, action: #selector(presentSearchView))
            textfield.addGestureRecognizer(tapped)
            tapped.cancelsTouchesInView = false
        }

        return searchBar
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false

        return scrollView
    }()

    private let contentView = UIView()

    private let locationInfoView = LocationInfoView()
    private let twoDaysWeatherView = TwoDaysWeatherView()
    
    //test
    private let locationInfoView1 = LocationInfoView()
    private let locationInfoView2 = LocationInfoView()
    private let locationInfoView3 = LocationInfoView()
    private let locationInfoView4 = LocationInfoView()
    private let locationInfoView5 = LocationInfoView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .theme.mainViewBackground

        setupNavigationBar()
        setupLayout()
    }

    private func setupLayout() {
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }

        contentView.addSubview(locationInfoView)
        locationInfoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        contentView.addSubview(twoDaysWeatherView)
        twoDaysWeatherView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationInfoView.stackView.snp.bottom).offset(20)
        }
    }

    private func setupNavigationBar() {
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.barTintColor = .theme.mainViewBackground
        self.navigationController?.hidesBarsOnSwipe = true
    }

    @objc func presentSearchView() {
        print("Navigated SearchViewController")
    }
}
