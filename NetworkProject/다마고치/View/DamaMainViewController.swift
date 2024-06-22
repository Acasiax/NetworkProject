//
//  DamaMainViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit

class DamaMainViewController: UIViewController {
    
    // Create UI elements
    let bubbleImageView = UIImageView(image: UIImage(named: "bubble"))
    let tamagotchiImageView = UIImageView(image: UIImage(named: "1-4"))
    let speechLabel: UILabel = {
        let label = UILabel()
        label.text = "복습 아직 안하셨다고요? 지금 잠이 오세요? 대장님??"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let levelLabel: UILabel = {
        let label = UILabel()
        label.text = "방실방실 다마고치\nLV1 ・ 밥알 0개 ・ 물방울 0개"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let riceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("밥먹기", for: .normal)
        return button
    }()
    let waterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("물먹기", for: .normal)
        return button
    }()
    
    init(image: UIImage?) {
            self.tamagotchiImageView.image = image
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bubbleImageView)
        view.addSubview(tamagotchiImageView)
        view.addSubview(speechLabel)
        view.addSubview(levelLabel)
        view.addSubview(riceButton)
        view.addSubview(waterButton)
        
        bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(100)
        }
        
        speechLabel.snp.makeConstraints { make in
            make.center.equalTo(bubbleImageView)
            make.width.equalTo(bubbleImageView).offset(-20)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        riceButton.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        waterButton.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-40)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}
