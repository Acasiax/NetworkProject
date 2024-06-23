//
//  Dama+ext.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/24/24.
//

import Foundation
import UIKit

extension UILabel {
    static func createLabel(text: String, alignment: NSTextAlignment, lines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = alignment
        label.numberOfLines = lines
        return label
    }
}

extension UITextField {
    static func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
        textField.textAlignment = .center
        return textField
    }
}

extension UIButton {
    static func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        return button
    }
}
