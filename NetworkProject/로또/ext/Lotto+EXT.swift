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
