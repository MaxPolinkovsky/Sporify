//
//  ModelSong.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import Foundation

struct Song {
    let artistName: String?
    let albumName: String?
    let imageName: String?
    let trackName: String?
    
    func initSongs() {
        guard self.artistName != nil else {return}
        guard self.albumName != nil else {return}
        guard self.imageName != nil else {return}
        guard self.trackName != nil else {return}
    }
}
