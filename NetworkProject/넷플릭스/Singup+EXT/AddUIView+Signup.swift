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
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        return label
    }
}


extension UITextField {
    static func createSignupTextField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
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

