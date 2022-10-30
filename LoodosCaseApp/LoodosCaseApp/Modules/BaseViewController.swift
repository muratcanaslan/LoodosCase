//
//  BaseViewController.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.backButtonTitle = ""
        
        applyTexts()
        applyStyling()
        applyAdditionalSetup()
    }
    
    func applyStyling() { }
    
    func applyTexts() { }
    
    func applyAdditionalSetup() { }
}
