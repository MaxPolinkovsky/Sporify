//
//  TracksVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class TracksVC: UIViewController {
    
    //https://johncodeos.com/how-to-add-search-in-uitableview-using-swift/
    
//    let songs = SPTManager.shared.songs
//    let songs =  SongsManager.shared.requestData()
    let songs =  SongsManager.shared.makeContext()
    var filteredSongs: [Song] = []
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchBar.delegate = nil
        self.tableView.dataSource = nil
        self.tableView.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

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
