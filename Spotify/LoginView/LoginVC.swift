//
//  ViewController.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//



import UIKit
import Firebase

class LoginVC: UIViewController {
    
    //https://garretthughes3.medium.com/unlocking-the-powers-of-spotifys-sdk-with-ios-on-swift-5-5b18b0f1fa65
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .azure
        loginButton.tintColor = .white
        createAccountButton.tintColor = .azure
        FirebaseManager.shared.downloadImagesFromFB(imageView: logoImage)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
//        FirebaseManager.shared.firebaseAuth()
        
        let playURI = SPTManager.shared.configuration.playURI!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appRemote = appDelegate.appRemote
        appRemote.authorizeAndPlayURI(playURI)
        
        print("Answer: \(appDelegate.accessToken)")
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {

    }
    
    
}

