//
//  TMDB.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/11/24.
//

import Foundation
import Alamofire
import SnapKit

struct TMDB {
    static let genreUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey.TMDBAPIKey)&language=en-US"
    static let movieUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey.TMDBAPIKey)&language=en-US&page=1"
    static let header: HTTPHeaders = [
        "Authorization": "Bearer \(APIKey.TMDBAcesseToken)",
        "Content-Type": "application/json;charset=utf-8"
    ]
    static var imagePath: String = ""
    static var movieImageUrl: URL? {
            return URL(string: "https://image.tmdb.org/t/p/w500\(imagePath)")
        }
        static func castingUrl(for movieId: Int) -> String {
            return "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(APIKey.TMDBAPIKey)&language=en-US"
        }
    static var searchUrl: String = "https://api.themoviedb.org/3/search/movie?api_key=\(APIKey.TMDBAPIKey)&language=en-US&query="
}
