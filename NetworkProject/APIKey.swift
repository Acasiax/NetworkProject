//
//  APIKey.swift
//  NetworkBasicUPgrade
//
//  Created by 이윤지 on 6/5/24.
//

import Foundation

//이그노어 파일
//파일 생성 전에 .gitignore 파일에 "이름을 먼저 명세"
struct APIURL {
    static let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="
    static let upbitURL = ""
    static let movieURLComponents: URLComponents = {
            var components = URLComponents(string: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")!
            return components
        }()
    
}

struct APIKey {
    static let movieKey = "7837802f3b92cc15de0d033485739761"
    static let weatherKey = "98452eee52fc2e5b3aa9be02efc8a3fb"
}
