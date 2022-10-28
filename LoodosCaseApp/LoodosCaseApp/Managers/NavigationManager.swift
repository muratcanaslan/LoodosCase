//
//  NavigationManager.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import UIKit

struct NavigationManager {
    
    static func showSplash() {
        let vc = SplashVC()
        vc.modalTransitionStyle = .crossDissolve
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    static func showMovieList() {
        let movieListVC = MovieListVC()
        let vc = UINavigationController(rootViewController: movieListVC)
        vc.modalTransitionStyle = .flipHorizontal
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.4, options: .curveEaseInOut, animations: nil, completion: nil)
    }
}
