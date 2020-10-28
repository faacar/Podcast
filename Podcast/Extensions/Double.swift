//
//  Double.swift
//  Podcast
//
//  Created by Ahmet Acar on 28.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import Foundation
//alternative version to display durationTime

extension Double {
    func toDisplayString() -> String {
        let totalSeconds = Int(self)
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
    
}
