//
//  ExtensionUISearchBarDelegate.swift
//  Spotify
//
//  Created by Max Polinkovsky on 09.02.21.
//

import Foundation

extension TracksVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSongs = songs.filter { $0.artistName!.lowercased().prefix(searchText.count) == searchText.lowercased() ||
            $0.albumName!.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.trackName!.lowercased().prefix(searchText.count) == searchText.lowercased()
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
