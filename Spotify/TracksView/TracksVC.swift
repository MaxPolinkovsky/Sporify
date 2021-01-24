//
//  TracksVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class TracksVC: UIViewController {
    
    var songs = [Song(artistName: "Rnado",
                      albumName: "123 Other",
                      imageName: "1",
                      trackName: "song1"),
                 Song(artistName: "Camilla Cabello",
                      albumName: "Havana album",
                      imageName: "3",
                      trackName: "song2"),
                 Song(artistName: "Coldplay",
                      albumName: "123 Something",
                      imageName: "2",
                      trackName: "song3"),
                 Song(artistName: "Rnado",
                      albumName: "123 Other",
                      imageName: "1",
                      trackName: "song1"),
                 Song(artistName: "Camilla Cabello",
                      albumName: "Havana album",
                      imageName: "3",
                      trackName: "song2"),
                 Song(artistName: "Coldplay",
                      albumName: "123 Something",
                      imageName: "2",
                      trackName: "song3"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //        self.tableView.delegate = self
        
    }
}

extension TracksVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.songs.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! SongCell
        let song = songs[indexPath.row]
        cell.albumLabel.text = song.albumName
        cell.albumImage.image = UIImage(named: song.imageName)
        cell.artistLabel.text = song.artistName
        cell.trackLabel.text = song.trackName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
