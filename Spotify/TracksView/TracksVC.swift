//
//  TracksVC.swift
//  Sporify
//
//  Created by Max Polinkovsky on 24.01.21.
//

import UIKit

class TracksVC: UIViewController {
    
    //https://johncodeos.com/how-to-add-search-in-uitableview-using-swift/
    
    let songs = Manager.shared.songs
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
            cell.albumLabel.text = filteredSong.albumName
            cell.albumImage.image = UIImage(named: filteredSong.imageName)
            cell.artistLabel.text = filteredSong.artistName
            cell.trackLabel.text = filteredSong.trackName
        } else {
            let song = songs[indexPath.row]
            cell.albumLabel.text = song.albumName
            cell.albumImage.image = UIImage(named: song.imageName)
            cell.artistLabel.text = song.artistName
            cell.trackLabel.text = song.trackName
        }
    }
}

extension TracksVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSongs = songs.filter { $0.artistName.lowercased().prefix(searchText.count) == searchText.lowercased() ||
            $0.albumName.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.trackName.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
