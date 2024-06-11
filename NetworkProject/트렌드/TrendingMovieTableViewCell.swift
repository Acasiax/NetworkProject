//
//  TrendingMovieTableViewCell.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/11/24.
//

import UIKit
import Kingfisher
import SnapKit

struct CustomStyle {
    static let cornerRadius = CGFloat(10)
    
    static func createBorder(_ color: UIColor) -> UIView {
        let borderView = UIView()
        borderView.backgroundColor = color
        return borderView
    }
    
    static func createLabel(withText text: String = "", fontSize: CGFloat, textColor: UIColor = .black, fontWeight: UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        return label
    }
}



class TrendingMovieTableViewCell: UITableViewCell {
    static let identifier = "TrendingMovieTableViewCell"
    
    let releaseDateLabel = CustomStyle.createLabel(withText: "개봉일", fontSize: 13, textColor: .lightGray)
    let genreLabel = CustomStyle.createLabel(withText: "#장르", fontSize: 16, fontWeight: .bold)

    let movieCardView: UIView = {
        let cardView = UIView()
        cardView.layer.cornerRadius = CustomStyle.cornerRadius
        cardView.layer.shadowOpacity = 1
        cardView.backgroundColor = .white
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowRadius = CustomStyle.cornerRadius
        return cardView
    }()
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = CustomStyle.cornerRadius
        imageView.layer.masksToBounds = true
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    let titleLabel = CustomStyle.createLabel(fontSize: 18)
    
    let descriptionLabel = CustomStyle.createLabel(fontSize: 16, textColor: .lightGray)
    
    let separator = CustomStyle.createBorder(.darkGray)
    
    let detailsLabel = CustomStyle.createLabel(withText: "자세히 보기", fontSize: 13)
    
    let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = .black
        return imageView
    }()
    
    let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let ratingTitleLabel = CustomStyle.createLabel(withText: "평점", fontSize: 13, textColor: .white)
    let ratingValueLabel = CustomStyle.createLabel(fontSize: 13)
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
        configureLayout()
    }
    
    func setupHierarchy() {
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(movieCardView)
        movieCardView.addSubview(posterImageView)
        movieCardView.addSubview(titleLabel)
        movieCardView.addSubview(descriptionLabel)
        movieCardView.addSubview(separator)
        movieCardView.addSubview(detailsLabel)
        movieCardView.addSubview(moreImageView)
        movieCardView.addSubview(ratingStackView)
        [ratingTitleLabel, ratingValueLabel].forEach { ratingStackView.addArrangedSubview($0) }
    }
    
    func setupConstraints() {
        releaseDateLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(movieCardView)
            $0.height.equalTo(15)
        }
        
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(releaseDateLabel.snp.bottom).offset(4)
            $0.leading.equalTo(movieCardView)
        }
        
        movieCardView.snp.makeConstraints {
            $0.centerX.equalTo(contentView.snp.centerX)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.85)
            $0.top.equalTo(genreLabel.snp.bottom).offset(12)
            $0.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(20)
        }
        
        posterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(movieCardView)
            $0.height.equalTo(movieCardView.snp.height).multipliedBy(0.65)
        }
        
        ratingStackView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(posterImageView.snp.bottom).inset(20)
            $0.width.equalTo(movieCardView.snp.width).multipliedBy(0.2)
            $0.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(movieCardView).inset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(titleLabel)
        }
    
        separator.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalTo(descriptionLabel)
            $0.height.equalTo(1)
        }
        
        detailsLabel.snp.makeConstraints {
            $0.leading.equalTo(separator)
            $0.top.equalTo(separator.snp.bottom).offset(15)
        }
        
        moreImageView.snp.makeConstraints {
            $0.centerY.equalTo(detailsLabel.snp.centerY)
            $0.trailing.equalTo(movieCardView).inset(15)
        }
    }
    
    private func configureLayout() {
        self.selectionStyle = .none
        [ratingTitleLabel, ratingValueLabel].forEach { label in
            label.textAlignment = .center
        }
        ratingTitleLabel.backgroundColor = .systemTeal
        ratingValueLabel.backgroundColor = .white
    }
    
    func configureCell(with movie: Movie, genreDictionary: [Int: String]) {
        releaseDateLabel.text = movie.release_date
        ratingValueLabel.text = String(format: "%.1f", movie.vote_average)
        
        if let posterPath = movie.poster_path {
            TMDB.imagePath = posterPath
            posterImageView.kf.setImage(with: TMDB.movieImageUrl)
        }
        
        titleLabel.text = movie.title
        descriptionLabel.text = movie.overview
        
        var genreText = ""
        let genres = movie.genre_ids?.compactMap { $0 }
        genres?.forEach {
            if let genre = genreDictionary[$0] {
                genreText += "#\(genre) "
            }
        }
        genreLabel.text = genreText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
