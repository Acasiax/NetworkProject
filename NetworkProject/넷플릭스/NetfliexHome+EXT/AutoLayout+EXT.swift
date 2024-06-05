//
//  AutoLayout+EXT.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import SnapKit

extension UIViewController {
    func setupConstraints(headerLabel: UILabel ,headerImageView: UIImageView, playButton: UIButton, favoriteButton: UIButton, trendingLabel: UILabel, firstTrendingImageView: UIImageView, secondTrendingImageView: UIImageView, thirdTrendingImageView: UIImageView) {
        
        
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.centerX.equalTo(view)
        }
        
        
        headerImageView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        playButton.snp.makeConstraints {
            $0.leading.equalTo(headerImageView.snp.leading).offset(35)
            $0.bottom.equalTo(headerImageView.snp.bottom).offset(-16)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        
        favoriteButton.snp.makeConstraints {
            $0.trailing.equalTo(headerImageView.snp.trailing).offset(-35)
            $0.bottom.equalTo(headerImageView.snp.bottom).offset(-16)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }
        
        trendingLabel.snp.makeConstraints {
            $0.top.equalTo(headerImageView.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        firstTrendingImageView.snp.makeConstraints {
            $0.top.equalTo(trendingLabel.snp.bottom).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.width.equalTo(view.snp.width).dividedBy(3).offset(-16)
            $0.height.equalTo(firstTrendingImageView.snp.width).multipliedBy(1.5)
        }
        
        secondTrendingImageView.snp.makeConstraints {
            $0.top.equalTo(firstTrendingImageView)
            $0.leading.equalTo(firstTrendingImageView.snp.trailing).offset(8)
            $0.width.equalTo(firstTrendingImageView)
            $0.height.equalTo(firstTrendingImageView)
        }
        
        thirdTrendingImageView.snp.makeConstraints {
            $0.top.equalTo(firstTrendingImageView)
            $0.leading.equalTo(secondTrendingImageView.snp.trailing).offset(8)
            $0.width.equalTo(firstTrendingImageView)
            $0.height.equalTo(firstTrendingImageView)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
}

extension UITextField {
    func configureSignupTextField(placeholder: String, isSecure: Bool = false) {
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        self.isSecureTextEntry = isSecure
        self.backgroundColor = .gray
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 15)
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
    }
}
