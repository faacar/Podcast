//
//  Episode.swift
//  Podcast
//
//  Created by Ahmet Acar on 23.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let descripton: String
    
    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.descripton = feedItem.description ?? ""
    }
}
