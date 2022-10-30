//
//  MovieDetailVC.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import UIKit

class MovieDetailVC: BaseViewController {

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
        viewModel.getMovie()
    }
}
