//
//  EpisodesController.swift
//  Podcast
//
//  Created by Ahmet Acar on 22.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit


class EpisodesController: UITableViewController {
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    fileprivate let cellId = "cellId"
    
    struct Episode {
        let title: String
    }
    
    var episodes = [
        Episode(title: "first episodes"),
        Episode(title: "second episodes"),
        Episode(title: "third episodes")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: -Setup Work
    
    fileprivate func setupTableView() {
        navigationItem.backBarButtonItem?.tintColor = UIColor(red: 0.501960813999176, green: 0.0, blue: 0.501960813999176, alpha: 1.0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    
    
    //MARK: -UITableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return podcast?.trackCount ?? 1
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]

        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
    
    
    
}
