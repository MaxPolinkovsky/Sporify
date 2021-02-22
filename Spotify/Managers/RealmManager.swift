//
//  RealmManager.swift
//  Spotify
//
//  Created by Max Polinkovsky on 07.02.21.
//

import Foundation
import RealmSwift



class RealmManager {
    
    private lazy var realm = try! Realm()
    
    static let shared = RealmManager()
    
    func writeTobase(text: String) {
        let user = User()
        DispatchQueue.main.async {
            do {
                self.realm.beginWrite()
                user.name = text
                self.realm.add(user)
                try self.realm.commitWrite()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
