//
//  NetfliexHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import SnapKit

class NetfliexHomeViewController: UIViewController {
    
    let headerImageView = UIImageView.createImageView(named: "명량")
        let playButton = UIButton.createPlayButton()
        let favoriteButton = UIButton.createFavoriteButton()
        let trendingLabel = UILabel.createLabel(withText: "지금 뜨는 콘텐츠")
        let firstTrendingImageView = UIImageView.createImageView(named: "응답하라 1988")
        let secondTrendingImageView = UIImageView.createImageView(named: "태어난 김에 세계일주")
        let thirdTrendingImageView = UIImageView.createImageView(named: "코미디 로얄")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
       
    }
  
    private func setupViewHierarchy() {
          view.addSubview(headerImageView)
          view.addSubview(playButton)
          view.addSubview(favoriteButton)
          view.addSubview(trendingLabel)
          view.addSubview(firstTrendingImageView)
          view.addSubview(secondTrendingImageView)
          view.addSubview(thirdTrendingImageView)
      }
      

}
