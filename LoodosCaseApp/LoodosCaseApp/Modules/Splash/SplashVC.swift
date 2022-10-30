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
    
    private var timer: Timer?
    private var count = 3
    
    override func applyStyling() {
        super.applyStyling()
        
        messageButton.layer.cornerRadius = 8
        setTimeLabelHidden(true)
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
    
    private func setTimeLabelHidden(_ isHidden: Bool) {
        timeLabel.isHidden = isHidden
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showTimerUI), userInfo: nil, repeats: true)
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
    }
    
    @objc private func showTimerUI() {
        if count != 0 {
            setTimeLabelHidden(false)
            timeLabel.text = ("Navigate to movie list... \(count)")
            count -= 1
        }
        else {
            invalidateTimer()
            setTimeLabelHidden(true)
            navigateMovieList()
        }
    }
    //MARK: - UIAction
    @IBAction private func didTapMessage(_ sender: UIButton) {
        NetworkStatusManager.shared.checkInternetConnection { isInternetConnected in
            isInternetConnected ? self.startTimer() : NavigationManager.showAlert(with: "İnternet bağlantısı yok.")
        }
    }
    
    private func navigateMovieList() {
        NavigationManager.showMovieList()
    }
}
