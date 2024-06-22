//
//  GOCHECollectionViewCell.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/7/24.
//
import UIKit
import SnapKit

class DamagotchiCollectionViewCell: UICollectionViewCell {
    static let shared = DamagotchiCollectionViewCell()
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCellViews()
    }
    
    func setupCellViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView).multipliedBy(0.8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.bottom.equalTo(contentView)
            make.height.equalTo(contentView).multipliedBy(0.2)
        }
    }
}

extension DamagotchiCollectionViewCell {
    override var reuseIdentifier: String {
        return "tamagotchiCell"
    }
}
