//
//  Manager.swift
//  Sporify
//
//  Created by Max Polinkovsky on 23.01.21.
//

import Foundation


class Manager: SPTConfiguration {
    
    
    lazy var configuration = SPTConfiguration(
        clientID: clientID,
        redirectURL: redirectURI
    )
    
}

