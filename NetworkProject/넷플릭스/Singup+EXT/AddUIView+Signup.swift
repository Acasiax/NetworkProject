//
//  AddUIView+Signup.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//
import UIKit

extension UILabel {
    static func createSignupTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "YUNFLIX"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        return label
    }
}


extension UITextField {
    static func createSignupTextField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = isSecure
        textField.backgroundColor = .gray
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }
}

extension UIButton {
    static func createSignupButton(title: String, titleColor: UIColor = .black, backgroundColor: UIColor = .white) -> UIButton {
        let button = UIButton()
        //NSAttributedString은 텍스트에 글꼴, 색상 등 적용 클래스. string: title 버튼 제목
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)
        ])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 8
        return button
    }
    
    static func createMoreInfoButton(title: String) -> UIButton {
        let button = UIButton()
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
        ])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
}

extension UISwitch {
    static func createSignupSwitch() -> UISwitch {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = .systemRed
        toggleSwitch.isOn = true
        return toggleSwitch
    }
}
