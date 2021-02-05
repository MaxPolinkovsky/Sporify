//
//  ViewController.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//



import UIKit
import Firebase
import RealmSwift

class LoginVC: UIViewController {
    
    //https://garretthughes3.medium.com/unlocking-the-powers-of-spotifys-sdk-with-ios-on-swift-5-5b18b0f1fa65
    
    
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
        //        FirebaseManager.shared.firebaseAuth()
        
        let playURI = SPTManager.shared.configuration.playURI!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appRemote = appDelegate.appRemote
        appRemote.authorizeAndPlayURI(playURI)
        
        print("Answer: \(appDelegate.accessToken)")
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let realm = try? Realm()
        let user = User()
        var alertTextField = UITextField()
        let alert = UIAlertController(title: "Add user", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { action in
            guard let text = alertTextField.text , !text.isEmpty else { return }
            if user.name.isEmpty {
                DispatchQueue.main.async {
                    do {
                        realm?.beginWrite()
                        user.name = text
                        try realm?.commitWrite()
                        print("User: \(user.name)")
                        print(realm!.configuration.fileURL?.absoluteURL as Any)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        alert.addTextField { textField in
            alertTextField = textField
            alertTextField.placeholder = ""
        }
        present(alert, animated: true, completion: nil) // Вызываем алёрт контроллер
    }
    
    
    func updateColors() {
        loginButton.backgroundColor = RCValues.shared.color(forKey: .azureColor)
        loginButton.tintColor = RCValues.shared.color(forKey: .whiteColor)
    }
    
}

