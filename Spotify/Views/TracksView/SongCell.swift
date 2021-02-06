//
//  SongCell.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateColors()        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateColors() {
        artistLabel.textColor = RCValues.shared.color(forKey: .azureColor)
        albumLabel.textColor = RCValues.shared.color(forKey: .azureColor)
        trackLabel.textColor = RCValues.shared.color(forKey: .azureColor)
        
    }
    
    func setDataCell(song: Song) {
        artistLabel.text = song.artistName
        albumLabel.text = song.albumName
        trackLabel.text = song.trackName
        albumImage.image = UIImage(named: song.imageName ?? "person.circle")
    }
}
