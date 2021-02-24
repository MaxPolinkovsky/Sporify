//
//  SongsManager.swift
//  Spotify
//
//  Created by Max Polinkovsky on 06.02.21.
//

import Foundation
import CoreData

class SongsManager {
    
    static let shared = SongsManager()
    let songs = SPTManager.shared.testSongs
    
    //создание сущности
    func makeContext() {
        if let context = CoreDataManager.shared.managedContext, let _ = NSEntityDescription.entity(forEntityName: SongEntity.entityID, in: context){
            do {
                for song in songs {
                    let s = SongEntity(context: context)
                    s.albumName = song.albumName
                    s.artistName = song.artistName
                    s.trackName = song.trackName
                    s.imageName = song.imageName
                    try context.save()
                }
            } catch {
                context.rollback()
                print(error.localizedDescription)
            }
        }
    }
    //запрос данных
    func requestData() -> [Song] {
        if let context = CoreDataManager.shared.managedContext {
            let request: NSFetchRequest<SongEntity> = SongEntity.fetchRequest()
            do {
                let result = try context.fetch(request) as [SongEntity]
                let songs = result.map{$0.initSong()}
                print("Songs: \(songs)")
                return songs
            } catch {
                print(error.localizedDescription)
            }
        }
        return [Song]()
    }
}
