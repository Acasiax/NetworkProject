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
    
    static let identifier = WeatherAPIModels()
    init() {}
    private let apiKey = APIKey.weatherKey
    
    private func getURL(latitude: Double, longitude: Double) -> URL? {
        var baseURL = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        let latitudeQuery = URLQueryItem(name: "lat", value: String(latitude))
        let longitudeQuery = URLQueryItem(name: "lon", value: String(longitude))
        let lang = URLQueryItem(name: "lang", value: "kr")
        let units = URLQueryItem(name: "units", value: "metric")
        let apiKeyQuery = URLQueryItem(name: "appid", value: apiKey) //고유한 API 키
        baseURL?.queryItems = [latitudeQuery, longitudeQuery, lang, units, apiKeyQuery]
        
        return baseURL?.url
    }
    
    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (Int?, Any?) -> Void) {
        guard let url = getURL(latitude: latitude, longitude: longitude) else {
            print("URL build fail")
            completion(500, nil)
            return
        }
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                let code = response.response?.statusCode
                completion(code, value)
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(500, nil)
            }
        }
    }
}
