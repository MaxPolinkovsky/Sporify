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
