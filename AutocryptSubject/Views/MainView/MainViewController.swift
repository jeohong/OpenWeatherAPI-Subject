//
//  MainViewController.swift
//  AutocryptSubject
//
//  Created by Hong jeongmin on 2023/02/13.
//

import UIKit

class MainViewController: UIViewController {
    // Component
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"

        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .theme.searchBarBackground

            let tapped = UITapGestureRecognizer(target: self, action: #selector(presentSearchView))
            textfield.addGestureRecognizer(tapped)
        }

        return searchBar
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .theme.mainViewBackground
        
        self.navigationItem.titleView = searchBar
    }

    @objc func presentSearchView() {
        print("Navigated SearchViewController")
    }
}
