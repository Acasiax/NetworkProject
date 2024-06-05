//
//  Signup+Constraints.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import SnapKit

//가보자~~ SnapKit~!

extension UIView {
    func configureSignUpConstraints(titleLabel: UILabel,
                                    emailTextField: UITextField,
                                    passwordTextField: UITextField,
                                    usernameTextField: UITextField,
                                    locationTextField: UITextField,
                                    referralCodeTextField: UITextField,
                                    signUpButton: UIButton,
                                    additionalInfoButton: UIButton,
                                    infoToggleSwitch: UISwitch) {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalTo(self)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalTo(self)
            $0.width.equalTo(self.snp.width).multipliedBy(0.8)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.centerX.equalTo(emailTextField)
            $0.width.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.centerX.equalTo(passwordTextField)
            $0.width.equalTo(passwordTextField)
            $0.height.equalTo(passwordTextField)
        }
        
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(10)
            $0.centerX.equalTo(usernameTextField)
            $0.width.equalTo(usernameTextField)
            $0.height.equalTo(usernameTextField)
        }
        
        referralCodeTextField.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(10)
            $0.centerX.equalTo(locationTextField)
            $0.width.equalTo(locationTextField)
            $0.height.equalTo(locationTextField)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(referralCodeTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(referralCodeTextField)
            $0.width.equalTo(referralCodeTextField)
            $0.height.equalTo(50)
        }
        
        additionalInfoButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(10)
            $0.leading.equalTo(signUpButton.snp.leading)
        }
        
        infoToggleSwitch.snp.makeConstraints {
            $0.centerY.equalTo(additionalInfoButton)
            $0.trailing.equalTo(signUpButton.snp.trailing)
        }
    }
}
