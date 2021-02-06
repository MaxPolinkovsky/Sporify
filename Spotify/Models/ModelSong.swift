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
    
    func initSong(song: Song) -> Song {
        return Song(artistName: artistName ?? "",
                    albumName: albumName ?? "",
                    imageName: imageName ?? "",
                    trackName: trackName ?? "")
    }
}
