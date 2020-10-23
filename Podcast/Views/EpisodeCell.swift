 //
//  EpisodeCell.swift
//  Podcast
//
//  Created by Ahmet Acar on 23.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    var episode: Episode! {
        didSet {
            titleLabel.text = episode.title
            descriptionLabel.text = episode.descripton
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
        }

    }

}
