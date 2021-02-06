//
//  SongEntity+CoreDataProperties.swift
//  Spotify
//
//  Created by Max Polinkovsky on 06.02.21.
//
//

import Foundation
import CoreData


extension SongEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SongEntity> {
        return NSFetchRequest<SongEntity>(entityName: "SongEntity")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var albumName: String?
    @NSManaged public var imageName: String?
    @NSManaged public var trackName: String?

}

extension SongEntity : Identifiable {
   
   static var entityID: String {
        return "SongEntity"
    }
    
    func initSong() -> Song {
        return Song(artistName: artistName ?? "",
                    albumName: albumName ?? "",
                    imageName: imageName ?? "",
                    trackName: trackName ?? "")
    }
}
