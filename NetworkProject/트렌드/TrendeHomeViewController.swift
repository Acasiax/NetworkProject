//
//  TrendeHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/11/24.
//

import UIKit

class TrendeHomeViewController: UIViewController {

    let separator: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray5
        return separatorView
    }()
    
    let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
    }
    
    func setupHierarchy() {
            view.addSubview(separator)
            view.addSubview(tableView)
        }
        

}
