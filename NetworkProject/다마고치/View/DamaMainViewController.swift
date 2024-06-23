//
//  DamaMainViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit

class DamaMainViewController: UIViewController {
    
    let bubbleImageView = UIImageView(image: UIImage(named: "bubble"))
    let tamagotchiImageView = UIImageView(image: UIImage(named: "1-4"))
    let speechLabel: UILabel = {
        let label = UILabel()
        label.text = "복습 아직 안하셨다고요? 지금 잠이 오세요? 대장님??"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let levelTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "방실방실 다마고치"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    let riceCountLabel: UILabel = {
        let label = UILabel()
        label.text = "밥알 0개"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    let waterCountLabel: UILabel = {
        let label = UILabel()
        label.text = "물방울 0개"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    let riceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "밥주세용"
        textField.textAlignment = .center
        return textField
    }()
    let waterTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "물주세용"
        textField.textAlignment = .center
        return textField
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
        setUI()
        
        riceButton.addTarget(self, action: #selector(handleRiceButtonTap), for: .touchUpInside)
        waterButton.addTarget(self, action: #selector(handleWaterButtonTap), for: .touchUpInside)
        
        loadSavedData()
        
    }
    
    @objc func handleRiceButtonTap() {
        let riceCount = Int(riceTextField.text ?? "0") ?? 0
        let waterCount = Int(waterTextField.text ?? "0") ?? 0
        
        updateUIForNewLevel(riceCount: riceCount, waterCount: waterCount, type: 2)
    }
    
    @objc func handleWaterButtonTap() {
        let riceCount = Int(riceTextField.text ?? "0") ?? 0
        let waterCount = Int(waterTextField.text ?? "0") ?? 0
        
        updateUIForNewLevel(riceCount: riceCount, waterCount: waterCount, type: 2)
    }
    
    func calculateLevel(riceCount: Int, waterCount: Int) -> Int {
        let level = (Double(riceCount) / 5.0) + (Double(waterCount) / 2.0)
        return min(10, max(1, Int(level)))
    }
    
    func getImageNameAndTitle(for level: Int, type: Int) -> (imageName: String, title: String, speech: String) {
        let imageName: String
        let title: String
        let speech: String
        
        switch type {
        case 1:
            let damagotchi = Damagotchi.group1[level - 1]
            imageName = damagotchi.imageName ?? ""
            title = damagotchi.title
            speech = damagotchi.speech
        case 2:
            let damagotchi = Damagotchi.group2[level - 1]
            imageName = damagotchi.imageName ?? ""
            title = damagotchi.title
            speech = damagotchi.speech
        case 3:
            let damagotchi = Damagotchi.group3[level - 1]
            imageName = damagotchi.imageName ?? ""
            title = damagotchi.title
            speech = damagotchi.speech
        default:
            imageName = "준비중"
            title = "준비중"
            speech = "준비중"
        }
        
        return (imageName, title, speech)
    }
    
    func updateUIForNewLevel(riceCount: Int, waterCount: Int, type: Int) {
        let level = calculateLevel(riceCount: riceCount, waterCount: waterCount)
        let (imageName, title, speech) = getImageNameAndTitle(for: level, type: type)
        
        tamagotchiImageView.image = UIImage(named: imageName)
        levelTitleLabel.text = title
        speechLabel.text = speech
        riceCountLabel.text = "밥알 \(riceCount)개"
        waterCountLabel.text = "물방울 \(waterCount)개"
        
        // 변경된 이미지와 레이블 텍스트를 UserDefaults에 저장
        UserDefaults.standard.set(imageName, forKey: "currentImageName")
        UserDefaults.standard.set(title, forKey: "currentTitle")
        UserDefaults.standard.set(speech, forKey: "currentSpeech")
    }
    
    func loadSavedData() {
           if let imageName = UserDefaults.standard.string(forKey: "currentImageName"),
              let title = UserDefaults.standard.string(forKey: "currentTitle"),
              let speech = UserDefaults.standard.string(forKey: "currentSpeech") {
               tamagotchiImageView.image = UIImage(named: imageName)
               levelTitleLabel.text = title
               speechLabel.text = speech
           }
       }
       
    
    func setUI() {
        
        view.addSubview(bubbleImageView)
        view.addSubview(tamagotchiImageView)
        view.addSubview(speechLabel)
        view.addSubview(levelTitleLabel)
        view.addSubview(riceCountLabel)
        view.addSubview(waterCountLabel)
        view.addSubview(riceTextField)
        view.addSubview(riceButton)
        view.addSubview(waterTextField)
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
        
        levelTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        riceCountLabel.snp.makeConstraints { make in
            make.top.equalTo(levelTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        waterCountLabel.snp.makeConstraints { make in
            make.top.equalTo(riceCountLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        
        waterTextField.snp.makeConstraints { make in
            make.top.equalTo(waterCountLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        waterButton.snp.makeConstraints { make in
            make.centerY.equalTo(waterTextField)
            make.left.equalTo(waterTextField.snp.right).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.top.equalTo(waterTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        riceButton.snp.makeConstraints { make in
            make.centerY.equalTo(riceTextField)
            make.left.equalTo(riceTextField.snp.right).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        
    }
    
}

