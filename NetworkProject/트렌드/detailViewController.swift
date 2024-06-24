//
//  detailViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/23/24.

import UIKit
import Alamofire
import SnapKit

class DetailViewController: UIViewController {
    
    private var model: TrendeModel
    
    let tableView = UITableView()
    var cast: [Actor] = []
    
    init(model: TrendeModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTableView()
        setupTableHeaderView()
        fetchCasting(for: model.id)
        fetchMovieDetails(for: model.id)
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            updateTableHeaderViewLayout()
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           updateTableHeaderViewLayout()
       }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CastCell.self, forCellReuseIdentifier: "CastCell")
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTableHeaderView() {
        let headerView = UIView()

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = model.image
        headerView.addSubview(imageView)

        let titleLabel = UILabel()
        titleLabel.text = model.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerView.addSubview(titleLabel)

        let overviewLabel = UILabel()
        overviewLabel.numberOfLines = 3
        headerView.addSubview(overviewLabel)

        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGestureRecognizer)
        
        tableView.tableHeaderView = headerView
    }
    
    @objc private func imageTapped() {
        fetchSimilarMovies(for: model.id)
            let recommendVC = RecommendViewController()
            navigationController?.pushViewController(recommendVC, animated: true)
        }
    
    private func updateTableHeaderViewLayout() {
            guard let headerView = tableView.tableHeaderView else { return }
            headerView.layoutIfNeeded()
            let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            headerView.frame.size = CGSize(width: headerSize.width, height: headerSize.height)
            tableView.tableHeaderView = headerView
        }
    
    
    private func fetchSimilarMovies(for movieId: Int) {
        let url = TMDB.similarMoviesUrl(for: movieId)
        
        AF.request(url).responseDecodable(of: SimilarMoviesContainer.self) { response in
            switch response.result {
            case .success(let similarMoviesContainer):
                let recommendVC = RecommendViewController()
                recommendVC.similarMovies = similarMoviesContainer.results
                self.navigationController?.pushViewController(recommendVC, animated: true)
            case .failure(let error):
                print("Failed to fetch similar movies: \(error)")
            }
        }
    }
    
    
    
    private func fetchMovieDetails(for movieId: Int) {
        let url = "https://api.themoviedb.org/3/movie/\(movieId)"
        let parameters: Parameters = [
            "api_key": APIKey.TMDBAPIKey,
            "language": "ko-KR"
        ]
        
        AF.request(url, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let overview = json["overview"] as? String {
                    DispatchQueue.main.async {
                        self.updateHeaderView(overview: overview)
                    }
                }
                print("영화 디테일이 성공적이에요!")
            case .failure(let error):
                print("에헤이~ 영화 디테일 가져오는데 실패했어요ㅠ: \(error)")
            }
        }
    }
    

    private func updateHeaderView(overview: String) {
            if let headerView = tableView.tableHeaderView {
                for subview in headerView.subviews {
                    if let label = subview as? UILabel, label.numberOfLines == 3 {
                        label.text = overview
                        break
                    }
                }
                updateTableHeaderViewLayout()
            }
        }
    
    private func fetchCasting(for movieId: Int) {
        let url = "https://api.themoviedb.org/3/movie/\(movieId)/credits"
        let parameters: Parameters = [
            "api_key": APIKey.TMDBAPIKey
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: Casting.self) { response in
            switch response.result {
            case .success(let casting):
                self.cast = casting.cast
                self.tableView.reloadData()
            case .failure(let error):
                print("Failed to fetch casting data: \(error)")
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as! CastCell
        let actor = cast[indexPath.row]
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(actor.profile_path ?? "")")
        
        // Download image and configure cell
        downloadImage(from: imageUrl) { image in
            cell.configure(name: actor.name, role: actor.character, image: image)
        }
        
        return cell
    }
    
    private func downloadImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}

class CastCell: UITableViewCell {
    let castImageView = UIImageView()
    let nameLabel = UILabel()
    let roleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(castImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)
        
        castImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(castImageView.snp.trailing).offset(16)
            make.top.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.trailing.equalTo(nameLabel)
            make.bottom.equalTo(contentView).offset(-16)
        }
        
       
        nameLabel.numberOfLines = 0
        roleLabel.numberOfLines = 0
    }
    
    func configure(name: String, role: String, image: UIImage?) {
        nameLabel.text = name
        roleLabel.text = role
        castImageView.image = image
    }
}


//struct Actor: Decodable {
//    let name: String
//    let character: String
//    let profile_path: String?
//}
//
//struct Casting: Decodable {
//    let cast: [Actor]
//}
//
//struct APIKey {
//    static let TMDBAPIKey = ""
//}
