//
//  Movie+Constraints.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit
import SnapKit

extension UIViewController {
    
    func setupMovieHomeUI(searchField: UITextField, searchButton: UIButton, tableView: UITableView) {
        view.addSubviews(searchField, searchButton, tableView)
        
        searchField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(searchButton.snp.left).offset(-10)
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
                   make.centerY.equalTo(searchField)
                   make.right.equalToSuperview().offset(-20)
                   make.height.equalTo(40)
                   make.width.equalTo(80)
               }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
     
        
    }
    
    
}
