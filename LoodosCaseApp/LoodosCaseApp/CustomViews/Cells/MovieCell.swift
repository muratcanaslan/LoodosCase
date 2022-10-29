//
//  MovieCell.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 29.10.2022.
//

import UIKit

final class MovieCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieDesc: UILabel!
    
    func configure(with model: MovieCellViewModel) {
        if let url = model.imageURL {
            movieImage.downloadedFrom(url: url)
        }
        
        movieName.text = model.name
        movieDesc.text = model.desc
    }
}

extension MovieCell {
    static var reuseIdentifier = "MovieCell"
    
    static func registerNib() -> UINib {
        .init(nibName: String("MovieCell"), bundle: nil)
    }
}
