//
//  ViewController.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//



import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
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
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
    }
}

