//
//  FirebaseManager.swift
//  Spotify
//
//  Created by Max Polinkovsky on 29.01.21.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage

class FirebaseManager {
    
    static let shared = FirebaseManager()
    let storage = Storage.storage()
    let auth = Auth.auth()
    
//    func firebaseAuth() {
//        auth.signInAnonymously { [weak self] (authResult, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            } else {
//                print("User: \(String(describing: self?.auth)), signet")
//                return
//            }
//        }
//    }
    
    func downloadImagesFromFB(imageView: UIImageView){
        let ref = storage.reference().child("Images/logo.png")
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                print("Error: Image could not download!")
            } else {
                imageView.image = UIImage(data: data!)
            }
        }
    }
}
