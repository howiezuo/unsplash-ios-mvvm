//
//  Urls.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 5/1/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import Foundation
import ObjectMapper

class Urls: Mappable {
    
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
    
    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        raw     <- map["raw"]
        full    <- map["full"]
        regular <- map["regular"]
        small   <- map["small"]
        thumb   <- map["thumb"]
    }
    
}
