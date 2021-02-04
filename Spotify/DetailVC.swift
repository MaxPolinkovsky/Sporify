//
//  DetailVC.swift
//  Spotify
//
//  Created by Max Polinkovsky on 27.01.21.
//

import UIKit

class DetailVC: UIViewController {

    var song: Song!
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateColors()
    }
    
    func setupUI(){
        artistName.text = song.artistName
        albumName.text = song.albumName
        trackName.text = song.trackName
        image.image = UIImage(named: song.imageName)
    }
    
    func updateColors() {
        artistName.textColor = RCValues.shared.color(forKey: .azureColor)
        albumName.textColor = RCValues.shared.color(forKey: .azureColor)
        trackName.textColor = RCValues.shared.color(forKey: .azureColor)
        
    }
    
    @IBAction func doneTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
