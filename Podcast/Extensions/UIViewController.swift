//
//  UIViewController.swift
//  Podcast
//
//  Created by Ahmet Acar on 30.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
