//
//  Api.swift
//  NewsApp
//
//  Created by Monya on 7/3/20.
//  Copyright © 2020 Zhegalik.Inc. All rights reserved.
//

import Foundation

let API_KEY = "04009b9480044ccd89b9f56973388315"


public struct News {
    public let status: String
    public let totalResults: Int
    public let articles: [[Articles]]
}

public struct Articles {
    public let source: [Source]
    public let author: String
    public let title: String
    public let description: String
    public let url: String
    public let urlToImage: String
    public let publishedAt: String
    public let content: String
}

public struct Source {
    public let id: String
    public let name: String
}
