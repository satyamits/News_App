//
//  Article.swift
//  NewsApp
//
//  Created by Satyam Singh on 02/05/24.
//

import Foundation

struct Response: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
}

struct Article: Codable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var urlToImage: String?
    var url: String
    var publishedAt: String
    var content: String
}

struct Source: Codable {
    var id: String?
    var name: String
}

