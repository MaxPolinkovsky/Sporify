//
//  LoginAlert.swift
//  Spotify
//
//  Created by Max Polinkovsky on 07.02.21.
//

import UIKit

extension LoginVC {
    
    func loginAlert(user: User) {
        var alertTextField = UITextField()
        let alert = UIAlertController(title: "Add user", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Ok", style: .default) { action in
            guard let text = alertTextField.text , !text.isEmpty else { return }
            if user.name.isEmpty {
                RealmManager.writeTobase(text: text)
                self.toUserProfileVC(name: text)
                print(text)
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
    
    func toUserProfileVC(name: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(identifier: "UserProfileVC") as? UserProfileVC else { return }
        dvc.userName = name
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
}

