//
//  PodcastsSearchController.swift
//  Podcast
//
//  Created by Ahmet Acar on 18.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit


class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Test", artistName: "Ahmet"),
        Podcast(name: "Test2", artistName: "Ali"),
        Podcast(name: "Test2", artistName: "Ali"),

    ]
    let cellId = "cellId"
    //implement a UISearchController
    
   let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        //navigationController?.hidesBarsOnTap = true
        
        searchController.searchBar.delegate = self
        
        //1. register a cell for out tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        //TODO: later implement Alamofire to search Itunes API
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath)
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1 // to have infinite number of lines
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        return cell
    }
    
}
