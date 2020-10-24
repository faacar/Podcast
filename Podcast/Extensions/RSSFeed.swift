//
//  RSSFeed.swift
//  Podcast
//
//  Created by Ahmet Acar on 24.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import FeedKit


extension RSSFeed {
    func toEpisodes() -> [Episode] {
        
        let imageURL = iTunes?.iTunesImage?.attributes?.href
        
        var episodes = [Episode]() // blank Episode array temporary
        
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageURL == nil {
                episode.imageURL = imageURL
            }
            
            episodes.append(episode)
        })
        return episodes
        
    }
}
