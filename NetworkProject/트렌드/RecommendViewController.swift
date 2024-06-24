//
//  RecommendViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/24/24.
//

import UIKit

class RecommendViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "관련 영화 추천해드립니다"
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

