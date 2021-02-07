//
//  RealmManager.swift
//  Spotify
//
//  Created by Max Polinkovsky on 07.02.21.
//

import Foundation
import RealmSwift

var realm = try! Realm()

class RealmManager {

   static func writeTobase(text: String) {
        let user = User()
        DispatchQueue.main.async {
            do {
                realm.beginWrite()
                user.name = text
                realm.add(user)
                try realm.commitWrite()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
