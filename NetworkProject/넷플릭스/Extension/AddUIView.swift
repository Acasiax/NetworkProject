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
        button.setTitle("재생", for: .normal)
        button.layer.cornerRadius = 7
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
    
    static func createFavoriteButton() -> UIButton {
        let button = UIButton()
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.layer.cornerRadius = 7
        button.backgroundColor = .darkGray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }
}

extension UIViewController {
    func configureUI(title: String) {
        view.backgroundColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .white
    }
}

extension UIImageView {
    static func createImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }
}
