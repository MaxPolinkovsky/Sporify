//
//  ModelUser.swift
//  Spotify
//
//  Created by Max Polinkovsky on 05.02.21.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name: String = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
