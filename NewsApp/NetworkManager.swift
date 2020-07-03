//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Monya on 7/3/20.
//  Copyright © 2020 Zhegalik.Inc. All rights reserved.
//

import Foundation
import Alamofire


enum Tags: String {
    case articles = "articles"
    case urlToImage = "urlToImage"
    case apiKey = "04009b9480044ccd89b9f56973388315"
    case baseURL = "https://newsapi.org/v2"
    case headlines = "/top-headlines"
    case everything = "/everything?"
    case q = "q="
    case from = "from="
}

class NetworkManager {
    static private let apiKey = "04009b9480044ccd89b9f56973388315"
    static public let baseURL = "https://newsapi.org/v2"
    
    static func makeRequest(url: String, completionHandler: @escaping (_ data:Data) -> ()) {
        Alamofire.request(url).responseString { (response) in
            switch response.result {
            
            case .success:
            guard let data = response.data else {return }
            completionHandler(data)
            
            case .failure:
                failureHandler(error: response.error!)
            
        }
    }
    
    }
    
    static func failureHandler(error: Error) {
        print(error)
    }

}
