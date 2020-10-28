//
//  APIService.swift
//  Podcast
//
//  Created by Ahmet Acar on 20.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService {

    let baseiTunesSearchURL = "https://itunes.apple.com/search"

    //singleton
    static let shared = APIService()
    
    func fetchEpisodes(feedURL: String, completionHandler: @escaping ([Episode]) -> ()) {
//        let feedURLString =
        //let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string: feedURL) else { return }

        DispatchQueue.global(qos: .background).async {
            let parser = FeedParser(URL: url)
        
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in

                switch result {
                case .success(let feed):
                    switch feed {
                    case let .rss(feed):
                        let episodes = feed.toEpisodes()
                        completionHandler(episodes)
                        break
                    default:
                        print("Error from parsing rss...")
                    }
                    
                case .failure(let error):
                    print("Failed to parse feed:", error)
                }
            }
        }
    }
    
    
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> () ) {
        print("Searching for podcasts...")
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        AF.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (response) in
                        if let err = response.error {
                print("Failed to contact yahoo!", err)
                return
            }
            guard let data = response.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                print(searchResult.resultCount)
                completionHandler(searchResult.results)
                
            } catch let decodeErr {
                print("Failed to decode:\(decodeErr)")
            }
        }
    }

    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
}
