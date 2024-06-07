//
//  WeatherTableViewCell.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit


class WeatherTableViewCell: UITableViewCell {
    static let identifier = "WeatherTableViewCell"
    
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)에서 오류가 났어용")
    }
    
    private func setupUI() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    func configure(description: String) {
        descriptionLabel.text = description
    }
}
