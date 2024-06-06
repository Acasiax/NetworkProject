//
//  Lotto+EXT.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit

extension UITextField {
    static func createCustomTextField(placeholder: String, keyboardType: UIKeyboardType = .default, textAlignment: NSTextAlignment = .left, borderStyle: UITextField.BorderStyle = .none) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = borderStyle
        textField.placeholder = placeholder
        textField.textAlignment = textAlignment
        textField.keyboardType = keyboardType
        return textField
    }
}

extension UIButton {
    static func createCustomButton(title: String, target: Any?, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}

extension UILabel {
    static func createCustomLabel(textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        return label
    }
}
