//
//  SceneDelegate.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
   
//    static private let kAccessTokenKey = "access-token-key"
//
//    var accessToken = defaults.string(forKey: kAccessTokenKey) {
//        didSet {
//            let defaults = UserDefaults.standard
//            defaults.set(accessToken, forKey: SceneDelegate.kAccessTokenKey)
//        }
//    }
//
//    lazy var appRemote: SPTAppRemote = {
//        let configuration = SPTConfiguration(clientID: clientID, redirectURL: redirectURI)
//        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
//        appRemote.connectionParameters.accessToken = self.accessToken
//        appRemote.delegate = self
//        return appRemote
//    }()
    
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sceneDelegate: SceneDelegate = ((scene?.delegate as? SceneDelegate)!)
        return sceneDelegate
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//        guard let url = URLContexts.first?.url else {return}
//        let parameters = appRemote.authorizationParameters(from: url);
        
        
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataManager.shared.saveContext()
    }
    
//    //MARK: -SPTAppRemotePlayerStateDelegate
//    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
//        print(#function)
//    }
//    
//    //MARK: -SPTAppRemoteDelegate
//    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
//        print(#function)
//    }
//    
//    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
//        print(#function)
//    }
//    
//    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
//        print(#function)
//    }
}

