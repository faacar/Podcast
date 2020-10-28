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
    let author: String
    var imageURL: String?
    let streamURL: String
    let timeDuration: Double
    init(feedItem: RSSFeedItem) {
        //url stream for audio
        self.streamURL = feedItem.enclosure?.attributes?.url ?? ""
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.descripton = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        self.imageURL = feedItem.iTunes?.iTunesImage?.attributes?.href
        self.timeDuration = feedItem.iTunes?.iTunesDuration ?? 00
    }
}
