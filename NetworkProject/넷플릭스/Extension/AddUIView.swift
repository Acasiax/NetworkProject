//
//  AddUIView.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit

extension UILabel {
    static func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }
}

extension UIButton {
    static func createPlayButton() -> UIButton {
        let button = UIButton()
        button.setTitle(" 재생", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
    
    static func createLikeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }
}


