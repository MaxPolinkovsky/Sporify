//
//  ExtensionTableView.swift
//  Spotify
//
//  Created by Max Polinkovsky on 09.02.21.
//

import Foundation

extension TracksVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredSongs.count
        } else {
            return songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = self.tableView.dequeueReusableCell(withIdentifier: cellID) as! SongCell
        cell.albumLabel.adjustsFontSizeToFitWidth = true
        cell.trackLabel.adjustsFontSizeToFitWidth = true
        cell.artistLabel.adjustsFontSizeToFitWidth = true
        isFiltred(indexPath, cell)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "toDetail", let indexPath = tableView.indexPathForSelectedRow {
            let dvc = segue.destination as! DetailVC
            if searching {
                dvc.song = filteredSongs[indexPath.row]
            } else {
                dvc.song = songs[indexPath.row]
            }
        }
    }
    
    fileprivate func isFiltred(_ indexPath: IndexPath, _ cell: SongCell) {
        if searching {
            let filteredSong = filteredSongs[indexPath.row]
            cell.setDataCell(song: filteredSong)
        } else {
            let song = songs[indexPath.row]
            cell.setDataCell(song: song)
        }
    }
}
