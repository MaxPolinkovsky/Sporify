//
//  SceneDelegate.swift
//  SpotifyNow
//
//  Created by Max Polinkovsky on 10.02.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        SPTManager.shared.loadParams(URLContexts)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if let _ = SPTManager.shared.appRemote.connectionParameters.accessToken {
            SPTManager.shared.appRemote.connect()
          }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        if SPTManager.shared.appRemote.isConnected {
            SPTManager.shared.appRemote.disconnect()
          }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}
