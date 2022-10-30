//
//  NetworkManager.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import Foundation
import Moya

final class NetworkManager {
    static let shared = NetworkManager()
    var provider = MoyaProvider<MovieTarget>(plugins: [NetworkLoggerPlugin()])

    private init () {}
    
    //MARK: - Movie search request with keyword
    func getMovie(with keyword: String = "", completion: @escaping (Result<[MovieResponse]?, Error>) -> ()) {
        provider.request(.movieList(.init(s: keyword))) { (response) in
            switch response {
            case.failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(MovieSearchRepsonse.self, from: value.data)
                    completion(.success(result.search))
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Movie detail request with imdbID
    func getMovieDetail(with imdbID: String, completion: @escaping (Result<MovieResponse?, Error>) -> ()) {
        provider.request(.movieDetail(.init(i: imdbID))) { (response) in
            switch response {
            case.failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(MovieResponse.self, from: value.data)
                    completion(.success(result))
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
