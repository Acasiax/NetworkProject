//
//  TrendMovie.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/11/24.
//

import Foundation
import Alamofire

struct MovieContainer: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
}

struct Movie: Decodable {
    let backdrop_path: String?
    let id: Int
    let original_title: String
    let overview: String
    let poster_path: String?
    let media_type: String?
    let adult: Bool
    let title: String
    let original_language: String
    let genre_ids: [Int]?
    let popularity: Double
    let release_date: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}




struct Genres: Decodable {
    let genres: [Genre]
    
    var genreDictionary: [Int: String]  {
        var dict: [Int: String] = [:]
        for genre in genres {
            dict[genre.id] = genre.name
        }
        return dict
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
