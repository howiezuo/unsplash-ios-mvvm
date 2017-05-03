//
//  APIClient.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 4/30/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxBlocking
import ObjectMapper


class APIClient {
    
    static let API_URL = "https://api.unsplash.com/"
    static let HEADERS: HTTPHeaders = [
        "Accept-Version": "v1",
        "Authorization": "Client-ID bb0b8493dba89c5b8765bdca724c00c3766b20971017f3315536ba19856e6287"
    ]
    
    static func getPhotos() -> Observable<[Photo]> {
        return Observable.create({ (observer) -> Disposable in
            let request = Alamofire.request(API_URL + "photos", headers: HEADERS)
            .responseJSON(completionHandler: { (response) in
                if let value = response.result.value {
                    let photos = Mapper<Photo>().mapArray(JSONObject: value)
                    observer.onNext(photos!)
                    observer.onCompleted()
                } else if let error = response.result.error {
                    observer.onError(error)
                }
            })
            
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
