//
//  MovieListViewModel.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import Foundation

protocol MovieListViewModelDelegate: AnyObject {
    func reload()
}

final class MovieListViewModel {
    
    var cellVMs = [MovieCellViewModel]()
    
    var keyword: String = "" {
        didSet {
            removeCellVMs()
            getMovieList()
        }
    }
        
    weak var delegate: MovieListViewModelDelegate?
    
    func getMovieList() {
        NetworkManager.shared.getMovie(with: keyword) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                if let response = response, !(response.isEmpty) {
                    self.cellVMs.append(contentsOf: response.map({ .init(model: $0)}))
                    self.delegate?.reload()
                } else {
                    
                }
                
            }
        }
    }
    
    func removeCellVMs() {
        self.cellVMs = []
    }
}
