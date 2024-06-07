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
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
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
