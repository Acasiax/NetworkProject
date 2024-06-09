//
//  MovieHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit
import Alamofire
import SnapKit

struct BoxOfficeModel {
    let rank: String
    let title: String
    let pubDate: String
    let movieCd: String
}

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String //해당일자의 박스오피스 순위를 출력합니다.
    let movieNm: String //영화명(국문)을 출력합니다.
    let openDt: String //영화의 개봉일을 출력합니다.
    let movieCd: String //영화의 대표코드를 출력합니다.
}



class MovieHomeViewController: UIViewController {

    var dayBoxOffice: [BoxOfficeModel] = []
    let searchField: UITextField = .makeSearchField()
    let searchButton: UIButton = .makeSearchButton(target: self, action: #selector(searchButtonClicked))
    let dateFormatter: DateFormatter = .defaultFormatter()
    let tableView: UITableView = UITableView()
    let selectedView: UIView = .makeSelectedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "영화과제"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        searchField.text = dateFormatter.string(from: yesterday)
        setupMovieHomeUI(searchField: searchField, searchButton: searchButton, tableView: tableView)
        tableView.configure(delegate: self, dataSource: self)
        searchBoxOffice()
    }
    @objc func searchButtonClicked() {
        print("버튼 클릭")
        searchBoxOffice()
    }
    
    func fetchData(queryDate: String) {
            guard let url = getURL(data: queryDate) else {
                fatalError("URL 생성에 실패했습니다.")
            }
        
            AF.request(url).responseDecodable(of: BoxOfficeResponse.self) { response in
                switch response.result {
                case .success(let value):
                    print("JSON: \(value)")
                    let tempDayBoxOffice = value.boxOfficeResult.dailyBoxOfficeList.map { receive in
                        BoxOfficeModel(
                            rank: receive.rank,
                            title: receive.movieNm,
                            pubDate: receive.openDt.count < 10 ? "미개봉" : receive.openDt,
                            movieCd: receive.movieCd
                        )
                    }
                    //🔧
                    DispatchQueue.main.async {
                        self.dayBoxOffice = tempDayBoxOffice
                        self.tableView.reloadData()
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }

    func getURL(data: String) -> URL? {
        var components = APIURL.movieURLComponents
        components.queryItems = [
            URLQueryItem(name: "key", value: APIKey.movieKey),
            URLQueryItem(name: "targetDt", value: data)
        ]
        return components.url
    }
    
    
    func searchBoxOffice() {
        guard let dayString = searchField.text, !dayString.isEmpty else {
            showAlert(message: "날짜를 입력해주세요.")
            return
        }
        fetchData(queryDate: dayString)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}


extension MovieHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return dayBoxOffice.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
           let movie = dayBoxOffice[indexPath.row]
           cell.textLabel?.text = "\(indexPath.row + 1)  \(movie.title)  \(movie.movieCd)"
           cell.detailTextLabel?.text = movie.pubDate
           cell.backgroundColor = .clear
           cell.textLabel?.textColor = .white
           cell.detailTextLabel?.textColor = .white
           return cell
       }
   }
