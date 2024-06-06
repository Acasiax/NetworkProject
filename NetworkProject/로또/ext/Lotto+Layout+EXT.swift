//
//  Lotto+Layout+EXT.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import Foundation
import UIKit
import SnapKit

extension RotaryHomeViewController {
    
    func setupUI() {
        view.addSubview(numberTextField)
        view.addSubview(checkButton)
        view.addSubview(resultLabel)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(drawResultLabel)
        view.addSubview(separatorView)
        
        
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(checkButton.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(drawResultLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
        
        drawResultLabel.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        setupNumberCircles()
        
    }
}
