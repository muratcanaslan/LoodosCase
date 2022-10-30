//
//  MovieSearchResponse.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import Foundation

struct MovieSearchRepsonse: Codable {
    let search: [MovieResponse]?
    let totalResults: String?
    let response: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}
