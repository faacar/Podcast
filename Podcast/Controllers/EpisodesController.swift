//
//  EpisodesController.swift
//  Podcast
//
//  Created by Ahmet Acar on 22.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit
import FeedKit

class EpisodesController: UITableViewController {
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
            fetchEpisodes()
        }
    }
    
    fileprivate func fetchEpisodes() {
        print("Looking for episodes at feed url", podcast?.feedUrl ?? "")
        guard let feedUrl = podcast?.feedUrl else { return }
        APIService.shared.fetchEpisodes(feedURL: feedUrl) { (episodes) in
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    fileprivate let cellId = "cellId"

    var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: -Setup Work
    
    fileprivate func setupTableView() {
        let nib = UINib(nibName: "EpisodeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.row]
        cell.episode = episode
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = self.episodes[indexPath.row]
        print("Trying to play episode",episode.title)
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        let playerDetailsView = Bundle.main.loadNibNamed("PlayerDetailsView", owner: self, options: nil)?.first as! PlayerDetailsView
        playerDetailsView.episode = episode
        playerDetailsView.frame = self.view.frame
        window?.addSubview(playerDetailsView)
    }
    
    
    

}
