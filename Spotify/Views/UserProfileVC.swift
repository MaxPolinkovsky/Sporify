//
//  UserDetailVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class UserProfileVC: UIViewController {

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(24)
        label.textAlignment = .center
        label.text = "UserName"
        return label
    }()

    private let imagePickerController = UIImagePickerController()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "account"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.layer.cornerRadius = 80 * 0.5
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        makeConstraints()
        iconViewConfigurate()
        updateColors()
    }
    
    // MARK: ImagePicker sourcetype
    private func addUsersPhoto() {
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: - User methods
    private func iconViewConfigurate() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconTap))
        iconImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func iconTap() {
        addUsersPhoto()
    }

    func updateColors() {
        userNameLabel.textColor = RCValues.shared.color(forKey: .azureColor)
    }
}

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
