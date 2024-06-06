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
        
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = UIImage(named: "밀수")
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        self.view.sendSubviewToBack(backgroundImageView) //서브뷰 게층순서 뒤로 보내기
        
        // 불투명한 검정색 배경 추가
        let blackOverlayView = UIView(frame: self.view.bounds)
        blackOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        self.view.addSubview(blackOverlayView)
        
        view.addSubviews(searchField, searchButton, tableView)
        
        searchField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
        tableView.backgroundColor = .clear
    }
   
}
