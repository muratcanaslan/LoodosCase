//
//  SplashVC.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import UIKit

final class SplashVC: BaseViewController {

    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var messageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func applyStyling() {
        super.applyStyling()
        
        messageButton.layer.cornerRadius = 8
    }
    
    override func applyTexts() {
        super.applyTexts()
        
        setMessageText()
    }
    
    private func setMessageText() {
        FirebaseManager.fetchMessageText { message in
            self.messageButton.setTitle(message, for: .normal)
    }
    }
    
    private func startTimer() {
        //TODO: - Show timer
    }
    
    //MARK: - UIAction
    @IBAction private func didTapMessage(_ sender: UIButton) {
        //TODO: Start timer
    }
    
    private func navigateMovieList() {
        //TODO: - Navigate MovieList module
    }
}
