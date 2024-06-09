//
//  WeatherTableViewCell.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    static let identifier = "WeatherTableViewCell"
    
    private let containerView = UIView()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)가 구현되지 않아 오류가 났어용")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(descriptionLabel)
        
        containerView.messageUISetup(backgroundColor: .white, cornerRadius: 8)
        
        descriptionLabel.chatLbSetup(fontSize: 16)
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func configure(description: String) {
        descriptionLabel.text = description
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.size.width = descriptionLabel.frame.size.width + 40 // 좌우 패딩 16씩 더해줌
    }
}

extension UIView {
    func messageUISetup(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}

extension UILabel {
    func chatLbSetup(fontSize: CGFloat, textColor: UIColor = .black) {
        self.backgroundColor = .clear
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        self.numberOfLines = 0
    }
}
