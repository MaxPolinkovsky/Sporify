//
//  ExtensionUIImagePicker.swift
//  Spotify
//
//  Created by Max Polinkovsky on 09.02.21.
//

import Foundation

// MARK: - UIImagePickerControllerDelegate
extension UserProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        iconImageView.image = image
    }
}

extension UserProfileVC {
    
    func addSubView() {
        view.addSubview(iconImageView)
        view.addSubview(userNameLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            userNameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 40),
            userNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            userNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            userNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
