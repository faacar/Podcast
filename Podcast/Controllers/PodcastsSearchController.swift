//
//  PodcastsSearchController.swift
//  Podcast
//
//  Created by Ahmet Acar on 18.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit
import Alamofire

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
        
        setupSearchBar()
        setupTableView()
        
        
    }
    
    //MARK: -Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        
        //TODO: later implement Alamofire to search Itunes API
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        AF.request(url).response { response in
            if let err = response.error {
                print("Failed to contact yahoo!", err)
                return
            }
            guard let data = response.data else { return }
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "nil coalecing")
        }
        
    }
    
    //MARK: -UITableView
    
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
