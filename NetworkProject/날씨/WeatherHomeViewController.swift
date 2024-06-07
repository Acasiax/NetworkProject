//
//  WeatherHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit

class WeatherHomeViewController: UIViewController {
    
    private let dateLabel = UILabel()
    private let currentLocationLabel = UILabel()
    private let tableView = UITableView()
    private var weatherData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        WeatherAPIModels.indentifier.fetchWeatherData(latitude: 37.5665, longitude: 126.9780) {(statusCode, data) in
                if statusCode == 200 {
                    if let weatherData = data {
                        print("🌐: \(weatherData)")
                    } else {
                        print("데이터 못 받아옴")
                    }
                } else {
                    // 상태 코드가 200이 아닌 경우 에러 처리
                    print("패치가져오는데 실패⚠️: \(statusCode)")
                }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.64, green: 0.82, blue: 1.00, alpha: 1.00)
        view.addSubview(dateLabel)
        view.addSubview(currentLocationLabel)
        view.addSubview(tableView)
        
        
        dateLabel.text = "10월 24일 09시 42분"
        dateLabel.textAlignment = .left
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        currentLocationLabel.text = "서울, 신림동"
        currentLocationLabel.textAlignment = .left
        currentLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.snp.makeConstraints { make in
            make.top.equalTo(currentLocationLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func loadData() {
        weatherData = [
            "지금은 9℃ 에요",
            "78% 만큼 습해요",
            "1m/s의 바람이 불어요",
            "오늘도 행복한 하루 보내세요"
        ]
        tableView.reloadData()
    }
}

extension WeatherHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = weatherData[indexPath.row]
        if let url = URL(string: data), UIApplication.shared.canOpenURL(url) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(description: data)
            cell.backgroundColor = .clear
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            cell.configure(description: data)
            cell.selectionStyle = .none
            return cell
        }
    }
}
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

