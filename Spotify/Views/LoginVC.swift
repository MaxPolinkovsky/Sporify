//
//  ViewController.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//



import UIKit
import Firebase
import RealmSwift

class LoginVC: UIViewController, SpotifyAccessListener {
   
    func accessGranted(accessToken: String) {
        
    }
    
    
    //https://garretthughes3.medium.com/unlocking-the-powers-of-spotifys-sdk-with-ios-on-swift-5-5b18b0f1fa65
    
    private let user = User()
    private let playURI = "spotify:track:20I6sIOMTCkB6w7ryavxtO"
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateColors()
    }
    func setupUI(){
        loginButton.layer.cornerRadius = 20
        //        loginButton.backgroundColor = .azure
        //        loginButton.tintColor = .white
        createAccountButton.tintColor = .azure
        FirebaseManager.shared.downloadImagesFromFB(imageView: logoImage)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        SpotifyManager.shared.delegate = self
        SpotifyManager.shared.authorizeAndPlay(playURI: playURI)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        loginAlert(user: user)
    }

    func updateColors() {
        loginButton.backgroundColor = RCValues.shared.color(forKey: .azureColor)
        loginButton.tintColor = RCValues.shared.color(forKey: .whiteColor)
    }
}

