//
//  Movie+Model.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit
import SnapKit

struct MoviedataModel {
    let rank: String
    let title: String
    let publicDate: String
}

struct MVdataResponse: Codable {
    let moavieResult: MVdataResult
}

struct MVdataResult: Codable {
    let dailyMVOfficeList: [DailyMVdata]
}

struct DailyMVdata: Codable {
    let rank: String
    let movieTitle: String
    let openData: String
}


extension UITextField {
    static func makeSearchField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "날짜 입력 (YYYYMMDD)"
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        return textField
    }
}

extension UIButton {
    func styleSettingUP() {
        self.backgroundColor = .green
        self.layer.cornerRadius = 10
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    static func makeSearchButton(target: Any, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        button.styleSettingUP()
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}


extension DateFormatter {
    static func defaultFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }
}


extension UITableView {
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.backgroundColor = .clear
        self.register(UITableViewCell.self, forCellReuseIdentifier: "movieCell")
    }
    
    static func makeConfigured(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) -> UITableView {
        let tableView = UITableView()
        tableView.configure(delegate: delegate, dataSource: dataSource)
        return tableView
    }
}


extension UIView {
    func addSubviews(_ views: UIView...) {
        for addview in views {
            self.addSubview(addview)
        }
    }
    
    static func makeSelectedView() -> UIView {
        let selectedView = UIView(frame: .zero)
         selectedView.backgroundColor = .white.withAlphaComponent(0.5)
         selectedView.layer.cornerRadius = 8
         return selectedView
     }
}

