//
//  Manager.swift
//  Sporify
//
//  Created by Max Polinkovsky on 23.01.21.
//

import Foundation


class Manager {
    
    static let shared = Manager()
    
    var configuration: SPTConfiguration = {
        let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURL)
        //играет последний трек пользователя
        configuration.playURI = ""
        // Set these url's to your backend which contains the secret to exchange for an access token
        // You can use the provided ruby script spotify_token_swap.rb for testing purposes
        configuration.tokenSwapURL = URL(string: "http://localhost:1234/swap")
        configuration.tokenRefreshURL = URL(string: "http://localhost:1234/refresh")
        return configuration
    }()

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
                      trackName: "song3"),
    ]
 }

