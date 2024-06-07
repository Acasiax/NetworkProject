//
//  WeatherAPI+Models.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

class WeatherAPIModels {
    
    static let indentifier = WeatherAPIModels()
    init() {}
    private let apiKey = APIKey.weatherKey
    
    private func getURL(latitude: Double, longitude: Double) -> URL? {
        var baseURL = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        let latitudeQuery = URLQueryItem(name: "lat", value: String(latitude))
        let longitudeQuery = URLQueryItem(name: "lon", value: String(longitude))
        let lang = URLQueryItem(name: "lang", value: "kr")
        let units = URLQueryItem(name: "units", value: "metric")
        let apiKeyQuery = URLQueryItem(name: "appid", value: apiKey)
        baseURL?.queryItems = [latitudeQuery, longitudeQuery, lang, units, apiKeyQuery]
        
        return baseURL?.url
    }
}
