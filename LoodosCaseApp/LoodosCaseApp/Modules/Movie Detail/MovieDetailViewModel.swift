//
//  MovieDetailViewModel.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import Foundation

final class MovieDetailViewModel {
    
    typealias OnLoading = (_ showLoading: Bool) -> Void
    typealias OnSuccess = (_ model: MovieResponse) -> Void
    typealias OnError   = (_ message: String?) -> Void
    
    var onSuccess: OnSuccess?
    var onError: OnError?
    var onLoading: OnLoading?
    
    private let imdbID: String
    
    init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func getMovie() {
        self.onLoading?(true)
        NetworkManager.shared.getMovieDetail(with: imdbID) { [weak self] result in
            self?.onLoading?(false)
            switch result {
            case .failure(let error):
                self?.onError?(error.localizedDescription)
            case .success(let response):
                guard let movie = response else { return }
                self?.onSuccess?(movie)
            }
        }
    }
}
