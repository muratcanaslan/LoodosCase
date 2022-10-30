//
//  MovieTarget.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 29.10.2022.
//

import Foundation
import Moya

private let apiKey = "55ec871a"

enum MovieTarget {
    case movieList(_ req: MovieSearchRequest)
    case movieDetail(_ req: MovieDetailRequest)
}

extension MovieTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://www.omdbapi.com/") else { return .init(string: "")!}
        return url
    }

    var path: String { "" }
    var method: Moya.Method { return .get }
    
    var task: Task {
        switch self {
        case .movieList(let req):
            return  .requestParameters(
                parameters: ["apikey" : apiKey,
                             "s" : req.s],
                encoding: URLEncoding.queryString
            )
        case .movieDetail(let req):
            return  .requestParameters(
                parameters: ["apikey" : apiKey,
                             "i" : req.i],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? { nil }
}
