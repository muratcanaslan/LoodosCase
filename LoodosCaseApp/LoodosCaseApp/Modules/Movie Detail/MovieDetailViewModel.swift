//
//  MovieDetailViewModel.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import Foundation

final class MovieDetailViewModel {
    
    typealias OnSuccess = () -> Void
    typealias OnError   = (_ message: String?) -> Void
    
    var onSuccess: OnSuccess?
    var onError: OnError?
    
    private let imdbID: String
    
    init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func getMovie() {
        NetworkManager.shared.getMovieDetail(with: imdbID) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                print(response)
            }
        }
    }
}
