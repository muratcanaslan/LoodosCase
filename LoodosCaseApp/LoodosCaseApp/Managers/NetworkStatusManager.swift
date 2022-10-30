//
//  NetworkStatusManager.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 30.10.2022.
//

import Foundation
import Alamofire

struct NetworkStatusManager {
    
    var reachabilityManager = NetworkReachabilityManager()
    static let shared = NetworkStatusManager()
    
    private init() { }
    
    func checkInternetConnection(completion: ((_ isInternetConnected: Bool) -> Void)? = nil) {
        reachabilityManager?.startListening(onUpdatePerforming: { (status) in
            switch status {
            case .reachable:
                completion?(true)
            default:
                completion?(false)
            }
        })
    }
}

private extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
