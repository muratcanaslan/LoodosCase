//
//  MovieListVC.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import UIKit

final class MovieListVC: BaseViewController {
    private let tableView = UITableView()
    private let searchBar = UISearchBar()
    
    override func applyAdditionalSetup() {
        super.applyAdditionalSetup()
        setTableViewUI()
        setTableViewProperties()
        setSearchBar()
    }
    
}
//MARK: - SearchBar Configuration
extension MovieListVC {
    private func setSearchBar() {
        navigationItem.titleView = searchBar
    }
}

//MARK: - TableView Configuration
extension MovieListVC {
    private func setTableViewUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setTableViewProperties() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

//MARK: - UITableView Delegate & Data Source
extension MovieListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .red
        return cell
    }
}
