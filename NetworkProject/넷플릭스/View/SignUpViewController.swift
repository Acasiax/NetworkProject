//
//  SignUpViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    let titleLabel = UILabel.createSignupTitleLabel()
       let emailTextField = UITextField.createSignupTextField(placeholder: "이메일 주소 또는 전화번호")
       let passwordTextField = UITextField.createSignupTextField(placeholder: "비밀번호", isSecure: true)
       let nicknameTextField = UITextField.createSignupTextField(placeholder: "닉네임")
       let locationTextField = UITextField.createSignupTextField(placeholder: "위치")
       let referralCodeTextField = UITextField.createSignupTextField(placeholder: "추천 코드 입력")
       
    let signUpButton = UIButton.createSignupButton(title: "회원가입")
    let moreInfoButton = UIButton.createMoreInfoButton(title: "추가 정보 입력")
    
    let toggleSwitch = UISwitch.createSignupSwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViewHierarchy()
    }
    
    func setupViewHierarchy() {
      
    }
    
  
}

