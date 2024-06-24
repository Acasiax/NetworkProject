//
//  RecommendViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/24/24.
//

import UIKit
import SnapKit

class RecommendViewController: UIViewController {
    var similarMovies: [Movie] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(RecomedMovieCell.self, forCellWithReuseIdentifier: RecomedMovieCell.identifier2)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomedMovieCell.identifier2, for: indexPath) as! RecomedMovieCell
        let movie = similarMovies[indexPath.row]
        if let posterPath = movie.poster_path {
            let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            cell.configure(imageUrl: imageUrl)
        }
        return cell
    }
}

class RecomedMovieCell: UICollectionViewCell {
    static let identifier2 = "RecomedMovieCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageUrl: URL?) {
        guard let url = imageUrl else {
            imageView.image = nil
            return
        }
        
        // Load the image from the URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}

