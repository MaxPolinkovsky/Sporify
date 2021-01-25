//
//  TracksVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class TracksVC: UIViewController {
    
    let songs = Manager.shared.songs
    
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
