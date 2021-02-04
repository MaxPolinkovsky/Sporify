//
//  Manager.swift
//  Sporify
//
//  Created by Max Polinkovsky on 23.01.21.
//

import Foundation


class SPTManager: NSObject {
    
    static let shared = SPTManager()
    
    var configuration: SPTConfiguration = {
        let configuration = SPTConfiguration(clientID: spotifyClientID, redirectURL: spotifyRedirectURL)
        //играет последний трек пользователя
        configuration.playURI = ""
        // Set these url's to your backend which contains the secret to exchange for an access token
        // You can use the provided ruby script spotify_token_swap.rb for testing purposes
        configuration.tokenSwapURL = URL(string: "http://localhost:1234/swap")
        configuration.tokenRefreshURL = URL(string: "http://localhost:1234/refresh")
        return configuration
    }()
    
    static var playerStateDidChange: (()->())?
    
    static var configuration = SPTConfiguration(
        clientID: spotifyClientID,
        redirectURL: spotifyRedirectURL
    )
    
    static var sessionManager: SPTSessionManager = {
        if let tokenSwapURL = URL(string: "https://xxx.glitch.me/api/token"),
           let tokenRefreshURL = URL(string: "https://xxx.glitch.me/api/refresh_token") {
            configuration.tokenSwapURL = tokenSwapURL
            configuration.tokenRefreshURL = tokenRefreshURL
        }
        
        if currentTrackId.count != 0 {
            configuration.playURI = "spotify:track:\(SPTManager.currentTrackId)"
        } else {
            configuration.playURI = ""
        }
        
        let manager = SPTSessionManager(configuration: configuration, delegate: shared)
        return manager
    }()
    
    static var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.delegate = shared
        return appRemote
    }()
    
    static var currentTrackId = ""
    
    static func play(track_id: String) {
        currentTrackId = track_id
        SPTManager.playerStateDidChange?()
        if sessionManager.session == nil || appRemote.isConnected == false {
            let requestedScopes: SPTScope = [.appRemoteControl]
            if #available(iOS 11.0, *) {
                sessionManager.initiateSession(with: requestedScopes, options: .default)
            }
        } else {
            appRemote.playerAPI?.play("spotify:track:\(currentTrackId)") { (restult, error) in
                
            }
        }
    }
    static func pause() {
        currentTrackId = ""
        SPTManager.playerStateDidChange?()
        appRemote.playerAPI?.pause { (restult, error) in
            
        }
    }
    static func isPlaying(track_id: String) -> Bool {
        return SPTManager.currentTrackId == track_id
    }
    
    var songs = [Song(artistName: "Rnado",
                      albumName: "123 Other",
                      imageName: "1",
                      trackName: "song1"),
                 Song(artistName: "Camilla Cabello",
                      albumName: "Havana album",
                      imageName: "3",
                      trackName: "song2"),
                 Song(artistName: "Coldplay",
                      albumName: "123 Something",
                      imageName: "2",
                      trackName: "song3"),
                 Song(artistName: "Rnado",
                      albumName: "123 Other",
                      imageName: "1",
                      trackName: "song1"),
                 Song(artistName: "Camilla Cabello",
                      albumName: "Havana album",
                      imageName: "3",
                      trackName: "song2"),
                 Song(artistName: "Coldplay",
                      albumName: "123 Something",
                      imageName: "2",
                      trackName: "song3")]
}

extension SPTManager: SPTSessionManagerDelegate {
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        NSLog("didInitiate \(session)")
        
        SPTManager.appRemote.connectionParameters.accessToken = session.accessToken
        SPTManager.appRemote.connect()
    }
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        NSLog("didFailWith \(error)")
    }
    func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
        NSLog("didRenew \(session)")
    }
}

extension SPTManager: SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        NSLog("didEstablishConnection")
        SPTManager.appRemote.playerAPI?.delegate = self
        SPTManager.appRemote.playerAPI?.subscribe { (result, error) in
            if let error = error {
                NSLog(error.localizedDescription)
            }
        }
        SPTManager.playerStateDidChange?()
    }
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        NSLog("didDisconnectWithError")
        SPTManager.currentTrackId = ""
        SPTManager.appRemote.disconnect()
        SPTManager.playerStateDidChange?()
    }
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        NSLog("didFailConnectionAttemptWithError")
        SPTManager.currentTrackId = ""
        SPTManager.appRemote.disconnect()
        SPTManager.playerStateDidChange?()
    }
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        NSLog("\(playerState.track.name)")
        SPTManager.playerStateDidChange?()
    }
}
