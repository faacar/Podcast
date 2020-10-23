//
//  APIService.swift
//  Podcast
//
//  Created by Ahmet Acar on 20.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation
import Alamofire

class APIService {

    let baseiTunesSearchURL = "https://itunes.apple.com/search"

    //singleton
    static let shared = APIService()
    
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
