//
//  Constats.swift
//  Sporify
//
//  Created by Max Polinkovsky on 18.01.21.
//

import UIKit

let cellID = "cell"
let userDefaults = UserDefaults.standard

//MARK: Spotify
let playURI = "spotify:artist:3W4xM5XYtUp4ifYYPVKVdk"
let SpotifyClientID = "d085134cf36647f1ba3df971f6f2f631"
let SpotifyRedirectURL = URL(string: "MySporify://returnAfterLogin")!
var accessToken = ""
let userDafault = UserDefaults.standard
let tokenKey = "tokenKey"
let spotify = SPTManager.shared
var appRemote: SPTAppRemote? {
    get {
        return spotify.appRemote
    }
}


//MARK: HEXColors
let azureColor = "#3F8FF7"
let whiteColor = "#FFFFFF"

extension UIColor {
    
    @nonobjc class var yellowOrange: UIColor {
        return UIColor(red: 247.0 / 255.0, green: 181.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 192.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var black10: UIColor {
        return UIColor(white: 0.0, alpha: 0.1)
    }
    
    @nonobjc class var vermillion: UIColor {
        return UIColor(red: 224.0 / 255.0, green: 32.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkLimeGreen: UIColor {
        return UIColor(red: 109.0 / 255.0, green: 212.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var brightOrange: UIColor {
        return UIColor(red: 250.0 / 255.0, green: 100.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var black: UIColor {
        return UIColor(white: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 72.0 / 255.0, green: 72.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkGrey: UIColor {
        return UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var azure: UIColor {
        return UIColor(red: 0.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var whiteTwo: UIColor {
        return UIColor(white: 246.0 / 255.0, alpha: 1.0)
    }
}

