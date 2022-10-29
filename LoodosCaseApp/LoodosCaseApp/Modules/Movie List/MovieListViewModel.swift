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
    
    var keyword: String? {
        didSet {
            reset()
        }
    }
    
    var cellVMs = [MovieCellViewModel]()
    
    weak var delegate: MovieListViewModelDelegate?
    
    func getMovieList(with keyword: String? = nil) {
        
    }
    
    private func reset() {
        
    }
}
