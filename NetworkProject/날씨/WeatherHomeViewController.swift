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
    }
    
    private func setupUI() {
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
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(description: data)
            return cell
        }
    }
}
