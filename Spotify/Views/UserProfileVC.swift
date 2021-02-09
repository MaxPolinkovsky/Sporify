//
//  UserDetailVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class UserProfileVC: UIViewController {

    var userName = ""
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(24)
        label.textAlignment = .center
        label.text = userName
        return label
    }()

    let imagePickerController = UIImagePickerController()
    
    lazy var iconImageView: UIImageView = {
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
    func addUsersPhoto() {
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
