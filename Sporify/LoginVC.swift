//
//  ViewController.swift
//  Sporify
//
//  Created by Max Polinkovsky on 21.01.21.
//


//mySpotify
//
//Client ID 2d4c3bc0f5bb4f6995b90628e53d2c84
//Client Secret ca8fee27bbaa415fa63e9415eb6511d0

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
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

