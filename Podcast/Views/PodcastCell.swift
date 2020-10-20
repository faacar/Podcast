//
//  PodcastCell.swift
//  Podcast
//
//  Created by Ahmet Acar on 20.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit


class PodcastCell: UITableViewCell {

    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    
    var podcast: Podcast! {
        
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
                
        }
    }
    
    
    
    

}
