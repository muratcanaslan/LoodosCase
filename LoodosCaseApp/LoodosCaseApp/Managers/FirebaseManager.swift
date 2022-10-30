//
//  FirebaseManager.swift
//  LoodosCaseApp
//
//  Created by Murat Can ASLAN on 28.10.2022.
//

import Foundation
import FirebaseRemoteConfig
import FirebaseCore
import Firebase

struct FirebaseManager  {
    static let shared = FirebaseManager()
    
    let config =  RemoteConfig.remoteConfig()
    
    private init() {}
    
    static func configureFirebase() {
        FirebaseApp.configure()
    }
    
    func configureRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        config.configSettings = settings
    }
    
    static func fetchMessageText(completion: @escaping (String?) -> Void) {
        FirebaseManager.shared.config.fetchAndActivate { status, error in
            switch status {
            case .successFetchedFromRemote:
                let message = FirebaseManager.shared.config.configValue(forKey: ConfigKeys.messageText).stringValue
                completion(message)
            default: break
            }
        }
    }
    
    static func sendEvent(eventName: String, parameters: [String: Any]? = nil) {
        Analytics.logEvent(eventName, parameters: parameters)
    }
}

enum ConfigKeys {
    /// "message_text" - show splash message
    static let messageText = "message_text"
  }

enum EventKeys {
    static let movieDetailShowed = "movie_detail_showed"
}
