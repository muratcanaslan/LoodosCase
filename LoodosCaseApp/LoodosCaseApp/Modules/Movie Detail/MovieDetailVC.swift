//
//  MovieDetailVC.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import UIKit

final class MovieDetailVC: BaseViewController {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieYear: UILabel!
    @IBOutlet private weak var moviePlot: UILabel!
    @IBOutlet private weak var movieGenre: UILabel!
    @IBOutlet private weak var movieDirector: UILabel!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var movieReleasedDate: UILabel!
    @IBOutlet private weak var movieRuntime: UILabel!
    
    private let viewModel: MovieDetailViewModel
    
    init(imdbID: String) {
        self.viewModel = MovieDetailViewModel(imdbID: imdbID)
        super.init(nibName: "MovieDetailVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func applyStyling() {
        super.applyStyling()
    }
    
    override func applyTexts() {
        super.applyTexts()
    }
    
    override func applyAdditionalSetup() {
        super.applyAdditionalSetup()
        
        setBlocks()
        viewModel.getMovie()
    }
    
    private func setUI(with movie: MovieResponse) {
        navigationItem.title = movie.title
        
        if let url = movie.posterURL {
            movieImage.downloadedFrom(url: url)
        }
        movieYear.text = "Year: \(movie.year ?? "-")"
        movieName.text = "Name: \(movie.title ?? "-")"
        moviePlot.text = "Description: \(movie.plot ?? "-")"
        movieGenre.text = "Genre: \(movie.genre ?? "-")"
        movieDirector.text = "Director: \(movie.director ?? "-")"
        movieRating.text = "Rating: \(movie.imdbRating ?? "-")"
        movieReleasedDate.text = "Released Date: \(movie.released ?? "-")"
        movieRuntime.text = "Duration: \(movie.runtime ?? "-")"
    }
}

extension MovieDetailVC {
    private func setBlocks() {
        viewModel.onSuccess = { [weak self] movie in
            self?.setUI(with: movie)
        }
        
        viewModel.onError = { [weak self] message in
            //TODO: Show error
            
        }
        
        viewModel.onLoading = { [weak self] showLoading in
            if showLoading {
                self?.showLoading()
            } else {
                self?.hideLoading()
            }
        }
    }
}

