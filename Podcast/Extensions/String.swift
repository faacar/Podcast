//
//  String.swift
//  Podcast
//
//  Created by Ahmet Acar on 24.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self :
        self.replacingOccurrences(of: "http", with: "https")
    }
}
