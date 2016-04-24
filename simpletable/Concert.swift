//
//  Concert.swift
//  simpletable
//
//  Created by Jason Meyer on 4/23/16.
//  Copyright © 2016 Jason Meyer. All rights reserved.
//

import UIKit

class Concert{
    
    
    var band: String
    var photo: UIImage?
    var month: String
    var day: String
    var location: String
    // MARK: Initialization
    
    init?(band: String, photo: UIImage?, month: String, day: String, location: String) {
        self.band = band
        self.photo = photo
        self.month = month
        self.day = day
        self.location = location
        if band.isEmpty {
            return nil
        }
    }
}