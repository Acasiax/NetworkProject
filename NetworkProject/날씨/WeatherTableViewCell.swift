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
        fatalError("init(coder:)가 구현되지 않아 오류가 났어용")
    }
    
    private func setupUI() {
        contentView.addSubview(descriptionLabel)
        contentView.messageUISetup(backgroundColor: .white, cornerRadius: 8)

        
       // descriptionLabel.numberOfLines = 0
        descriptionLabel.chatLbSetup(fontSize: 16)
      //  descriptionLabel.textColor = .black
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
            
        }
        
    }
    
    func configure(description: String) {
        descriptionLabel.text = description
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
