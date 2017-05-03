//
//  Photo.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 5/1/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {

    var id: String?
    
    var urls: Urls?
    

    required init?(map: Map) {
        //
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        urls    <- map["urls"]
    }
    
}
