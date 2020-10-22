//
//  Podcast.swift
//  Podcast
//
//  Created by Ahmet Acar on 18.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var trackCount: Int?
    var feedUrl: String?
}


