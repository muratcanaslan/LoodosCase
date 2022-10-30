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
    
    private let viewModel = MovieListViewModel()
    
    private var timer = Timer()
    
    override func applyAdditionalSetup() {
        super.applyAdditionalSetup()
        
        viewModel.delegate = self
        
        setTableViewUI()
        setTableViewProperties()
        if #available(iOS 13.0, *) {
            setSearchBar()
        }
        viewModel.getMovieList()
    }
}
//MARK: - SearchBar Configuration
@available(iOS 13.0, *)
extension MovieListVC {
    private func setSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.delegate = self
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
        tableView.register(MovieCell.registerNib(), forCellReuseIdentifier: MovieCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

//MARK: - UITableView Delegate & Data Source
extension MovieListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as? MovieCell else { return .init() }
        cell.configure(with: viewModel.cellVMs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let imdbID = viewModel.cellVMs[indexPath.row].imdbID else { return }
        let vc = MovieDetailVC(imdbID: imdbID)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - MovieListViewModel Delegate
extension MovieListVC: MovieListViewModelDelegate {
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - SearchBar Delegate
extension MovieListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
            self.viewModel.keyword = searchBar.text ?? ""
        })
        
    }
}
