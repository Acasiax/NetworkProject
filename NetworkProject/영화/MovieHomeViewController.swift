//
//  MovieHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit

class MovieHomeViewController: UIViewController {

    var dayBoxOffice: [MoviedataModel] = []
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
        searchBoxOffice()
    }
    @objc func searchButtonClicked() {
        print("버튼 클릭")
        searchBoxOffice()
    }
    
    func fetchcData(queryDate: String) {
        guard let url = getURL(date: queryDate) else {
            fatalError("URL 생성에 실패했습니다.")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("데이터가 응답 하지 않네용..")
                return
            }
            // 디버깅용 데이터 출력
                   if let jsonString = String(data: data, encoding: .utf8) {
                       print("받은 데이터: \(jsonString)")
                   }
                   
            do {
                let decoder = JSONDecoder()
                let boxOfficeResponse = try decoder.decode(MVdataResponse.self, from: data)
                let tempDayBoxOffice = boxOfficeResponse.moavieResult.dailyMVOfficeList.map { receive in
                    MoviedataModel(
                        rank: receive.rank,
                        title: receive.movieTitle,
                        publicDate: receive.openData.count < 10 ? "미개봉" : receive.openData
                    )
                }

                DispatchQueue.main.async {
                    self.dayBoxOffice = tempDayBoxOffice
                    self.tableView.reloadData()
                }
            } catch {
                print("JSON 파싱에서 에러가 났어요: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func getURL(date: String) -> URL? {
        var components = URLComponents(string: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
        components?.queryItems = [
            URLQueryItem(name: "key", value: APIKey.movieKey),
            URLQueryItem(name: "targetDt", value: date)
        ]
        return components?.url
    }
    

    
    func searchBoxOffice() {
        guard let dateString = searchField.text, !dateString.isEmpty else {
            showAlert(message: "날짜를 입력해주세요.")
            return
        }
        fetchcData(queryDate: dateString)
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
        cell.textLabel?.text = "\(indexPath.row + 1)  \(movie.title)"
        cell.detailTextLabel?.text = movie.publicDate
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        return cell
    }
    
    
    
    
    
}
