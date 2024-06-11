//
//  TrendeHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/11/24.
//

import UIKit
import Alamofire
import SnapKit

class TrendViewController: UIViewController {
    
    var trendData: [Movie] = []
    var genres: [Int: String] = [:]
    
    let trendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        return tableView
    }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           print(#function)
           configureView()
           configureNavigationBar()
           configureTableView()
           configureHierarchy()
           configureLayout()
           fetchMovieGenres()
           fetchMovies()
       }
       
    
    func configureTableView() {
        trendTableView.delegate = self
        trendTableView.dataSource = self
        trendTableView.register(TrendingMovieTableViewCell.self, forCellReuseIdentifier: TrendingMovieTableViewCell.identifier)
    }
    
    func configureView() {
        view.backgroundColor = .white
        
    }
    
    func configureNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let menu = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listButtonTapped))
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(didTapSearchButton))
        
        
        navigationItem.leftBarButtonItem = menu
        navigationItem.rightBarButtonItem = search
    }
    

    @objc func listButtonTapped() {
        print(#function)
    }
    
    
    @objc func didTapSearchButton() {
//        let searchViewController =
//        navigationController?.pushViewController(, animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(trendTableView)
    }
    
    func configureLayout() {
        trendTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func fetchMovieGenres() {
        AF.request(TMDB.genreUrl, headers: TMDB.header).responseDecodable(of: Genres.self) { response in
            switch response.result {
            case .success(let value):
                self.genres = value.genreDictionary
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchMovies() {
        AF.request(TMDB.movieUrl, headers: TMDB.header).responseDecodable(of: MovieContainer.self) { response in
            switch response.result {
            case .success(let value):
                self.trendData = value.results
                self.trendTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trendData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendingMovieTableViewCell.identifier, for: indexPath) as! TrendingMovieTableViewCell
               
        return cell
    }
    
    
}
