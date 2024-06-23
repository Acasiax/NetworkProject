//
//  TrendeHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit
import Alamofire

struct TrendeModel {
    let id: Int
    let date: String
    let genre: String
    let rating: Double
    let title: String
    let image: UIImage
}

class TrendyHomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView?
    
    private var models = [TrendeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureModels()
        configureCollectionView()
        fetchMovies()
    }
    
    private func configureModels() {
        //더미 데이터
        //        models.append(TrendeModel(date: "12/10/2020", genre: "#Mystery", rating: 3.3, title: "까꿍", image: UIImage(named: "더퍼스트슬램덩크")!))
        //        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        //        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        //        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        //        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        //        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
    }
    
    private func fetchMovies() {
        let url = "https://api.themoviedb.org/3/movie/popular" // TMDB API 엔드포인트
        let parameters: Parameters = [
            "api_key": APIKey.TMDBAPIKey, // API 키 적용
            "language": "ko-KR", // 원하는 언어 코드
            "page": 1
        ]
        
        AF.request(url, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(response)
                if let json = value as? [String: Any],
                   let results = json["results"] as? [[String: Any]] {
                    self.models.removeAll() // 기존 모델 초기화
                    let group = DispatchGroup()
                    
                    for movie in results {
                        if let title = movie["title"] as? String,
                           let id = movie["id"] as? Int,
                           let releaseDate = movie["release_date"] as? String,
                           let voteAverage = movie["vote_average"] as? Double,
                           let genreIds = movie["genre_ids"] as? [Int],
                           let posterPath = movie["poster_path"] as? String {
                            let genre = genreIds.first.flatMap { "#\($0)" } ?? "#Unknown"
                            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
                            
                            group.enter()
                            self.downloadImage(from: imageUrl) { image in
                                if let image = image {
                                    let movieModel = TrendeModel(id: id, date: releaseDate, genre: genre, rating: voteAverage, title: title, image: image)
                                    self.models.append(movieModel)
                                }
                                group.leave()
                            }
                        }
                    }
                    
                    group.notify(queue: .main) {
                        self.collectionView?.reloadData() // 컬렉션 뷰 업데이트
                    }
                }
                print("Successfully fetched movies")
            case .failure(let error):
                print("Failed to fetch movies: \(error)")
            }
        }
    }
    
    private func downloadImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(TrendyCollectionViewCell.self, forCellWithReuseIdentifier: TrendyCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendyCollectionViewCell.identifier, for: indexPath) as! TrendyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width-20, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        let detailVC = DetailViewController(model: model)
        
        // let movieId = models[indexPath.row].id
        // let detailVC = DetailViewController()
        //detailVC.movieId = movieId
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

