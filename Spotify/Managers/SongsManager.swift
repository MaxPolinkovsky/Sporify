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
            var songsEntity = [Song]()
            
            for song in songs {
                songsEntity.append(song)
            }
                do {
                    try context.save()
                } catch  {
                    context.rollback()
                    print(error.localizedDescription)
                }
            }
        }

    //запрос данных
    func requestData() -> [Song] {
        if let context = CoreDataManager.shared.managedContext {
            let request = NSFetchRequest<SongEntity>(entityName: SongEntity.entityID)
            do {
                let result = try context.fetch(request)
                let songs = result.map{$0.initSong()}
                print("Songs: \(songs)")
                return songs
                
            } catch  {
                print(error.localizedDescription)
            }
        }
        return [Song]()
    }
}
