//
//  MovieHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit

class MovieHomeViewController: UIViewController {

    var dayBoxOffice: [MoviedataModel] = []
    let searchField: UITextField = .makeSearchField()
    let searchButton: UIButton = .makeSearchButton(target: self, action: #selector(searchButtonClicked))
    let dateFormatter: DateFormatter = .defaultFormatter()
    let tableView: UITableView = UITableView()
    let selectedView: UIView = .makeSelectedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()


     
    }
    @objc func searchButtonClicked() {
    }
}


extension MovieHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayBoxOffice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = dayBoxOffice[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1)  \(movie.title)"
        cell.detailTextLabel?.text = movie.publicDate
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        return cell
    }
    
    
    
    
    
}
