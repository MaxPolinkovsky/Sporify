//
//  Manager.swift
//  Sporify
//
//  Created by Max Polinkovsky on 23.01.21.
//

import Foundation

class SPTManager: NSObject {
    
    var testSongs = [Song(artistName: "Rnado",
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
    
    static let shared = SPTManager()
    
    lazy var configuration: SPTConfiguration = {
        let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURL)
        configuration.playURI = ""
        return configuration
    }()
    
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = accessToken
        appRemote.delegate = self
        return appRemote
    }()
    
    func loadParams(_ URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        let parameters = appRemote.authorizationParameters(from: url)
        if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = access_token
            accessToken = access_token
            appRemote.connectionParameters.accessToken = accessToken
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: tokenKey)
        } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(error_description)
        }
    }
    
    func connect() {
        self.appRemote.authorizeAndPlayURI(playURI)
    }
}

extension SPTManager: SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    
    
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        
        print("connected")
    }
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("disconnected")
    }
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("failed")
    }
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        print("player state changed")
    }
}
