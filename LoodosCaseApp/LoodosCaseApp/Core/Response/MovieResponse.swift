//
//  MovieResponse.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import Foundation

struct MovieResponse: Codable {
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let poster: URL?
    let imdbID: String?
    let type: String?
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let response: String?
    let metascore: String?
    let imdbVotes: String?
    let imdbRating: String?
    let ratings: String?
    
    enum CodingKeys: String, CodingKey {
        case title      = "Title"
        case year       = "Year"
        case rated      = "Rated"
        case released   = "Released"
        case runtime    = "Runtime"
        case genre      = "Genre"
        case director   = "Director"
        case writer     = "Writer"
        case actors     = "Actors"
        case plot       = "Plot"
        case language   = "Language"
        case country    = "Country"
        case awards     = "Awards"
        case poster     = "Poster"
        case ratings    = "Ratings"
        case metascore  = "Metascore"
        case type       = "Type"
        case dvd        = "DVD"
        case boxOffice  = "BoxOffice"
        case production = "Production"
        case website    = "Website"
        case response   = "Response"
        case imdbID, imdbVotes, imdbRating
    }
    
    struct Source: Codable {
        let source: String?
        let value: String?
        
        enum CodingKeys: String, CodingKey {
            case source = "Source"
            case value  = "Value"
        }
    }
}
