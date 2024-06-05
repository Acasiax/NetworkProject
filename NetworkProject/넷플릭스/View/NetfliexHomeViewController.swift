//
//  NetfliexHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import SnapKit

class NetfliexHomeViewController: UIViewController {
    
    let headerLabel = UILabel.createLabel(withText: "이윤지님")
    let headerImageView = UIImageView.createImageView(named: "노량")
    let playButton = UIButton.createPlayButton()
    let favoriteButton = UIButton.createFavoriteButton()
    let trendingLabel = UILabel.createLabel(withText: "지금 뜨는 콘텐츠")
    let firstTrendingImageView = UIImageView.createImageView(named: "범죄도시3")
    let secondTrendingImageView = UIImageView.createImageView(named: "아바타물의길")
    let thirdTrendingImageView = UIImageView.createImageView(named: "육사오")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 컨트롤러로 감싸기🌟
              if navigationController == nil {
                  let navController = UINavigationController(rootViewController: self)
                  if let window = UIApplication.shared.windows.first {
                      window.rootViewController = navController
                      window.makeKeyAndVisible()
                  }
              }
        
        setupViewHierarchy()
        setupConstraints()
        configureUI(title: "홈")
        playButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
    }
    
    @objc private func playButtonClicked() {
           print("버튼 클릭")
           let signupVC = SignupViewController()
           navigationController?.pushViewController(signupVC, animated: true)
       }
    
    private func setupViewHierarchy() {
        view.addSubview(headerLabel)
        view.addSubview(headerImageView)
        view.addSubview(playButton)
        view.addSubview(favoriteButton)
        view.addSubview(trendingLabel)
        view.addSubview(firstTrendingImageView)
        view.addSubview(secondTrendingImageView)
        view.addSubview(thirdTrendingImageView)
    }
    
    private func setupConstraints() {
        setupConstraints(
            headerLabel: headerLabel, headerImageView: headerImageView,
            playButton: playButton,
            favoriteButton: favoriteButton,
            trendingLabel: trendingLabel,
            firstTrendingImageView: firstTrendingImageView,
            secondTrendingImageView: secondTrendingImageView,
            thirdTrendingImageView: thirdTrendingImageView
        )
    }
    
    
}

