//
//  CustomAlertViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit

class CustomAlertViewController: UIViewController {
    var alertImage: UIImage?
    var alertTitle: String?
    var alertMessage: String?
    var index: Int?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let cancelButton = UIButton()
    private let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyLayoutConstraints()
        configureContent()
        
    }
    private func setupViews() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        view.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(cancelButton)
        containerView.addSubview(startButton)
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.blue, for: .normal)
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        
        containerView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(containerView.snp.width).multipliedBy(1.2)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    private func applyLayoutConstraints() {
        
    }
    
    private func configureContent() {
        imageView.image = alertImage
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
    }
    
    @objc private func dismissAlert() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func startAction() {
        print("클릭")

        let damaMainVC = DamaMainViewController()
            if let navigationController = self.navigationController {
                print("푸쉬 대령이요~")
                navigationController.pushViewController(damaMainVC, animated: true)
            } else {
                print("모달 대령이요~")
                damaMainVC.modalPresentationStyle = .fullScreen
                self.present(damaMainVC, animated: true, completion: nil)
            }
           }
       }
