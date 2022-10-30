//
//  MovieCellViewModel.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 29.10.2022.
//

import Foundation

struct MovieCellViewModel {
    let name: String?
    let desc: String?
    let imageURL: URL?
    
    init(model: MovieResponse) {
        self.name = model.title
        self.desc = model.year
        self.imageURL = model.poster
    }
}
