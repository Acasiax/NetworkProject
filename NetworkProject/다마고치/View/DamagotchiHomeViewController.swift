//
//  DamagotchiHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit

class DamagotchiHomeViewController: UIViewController {

    let headerLabel = UILabel()
    let collectionView: UICollectionView
    let collectionViewLayout = UICollectionViewFlowLayout()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViews()
        applyLayoutConstraints()
      
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionViewLayout.scrollDirection = .vertical
        let cellWidth = (UIScreen.main.bounds.width - 40 - 2 * (3 - 1)) / 3
        collectionViewLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        collectionViewLayout.minimumInteritemSpacing = 2
        collectionViewLayout.minimumLineSpacing = 2
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.register(DamagotchiCollectionViewCell.self, forCellWithReuseIdentifier: DamagotchiCollectionViewCell.shared.reuseIdentifier)

       
    }
    func setupViews() {
        view.backgroundColor = .white
        headerLabel.text = "다마고치 선택하기"
        headerLabel.textAlignment = .center
        view.addSubview(headerLabel)
        view.addSubview(collectionView)

    }
    func applyLayoutConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(3)
            make.centerX.equalTo(view)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-10)
        }
    }
}

extension DamagotchiHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Damagotchi.allInstances.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DamagotchiCollectionViewCell.shared.reuseIdentifier, for: indexPath) as! DamagotchiCollectionViewCell
        let tamagotchi = Damagotchi.allInstances[indexPath.row]
        configureCell(cell, with: tamagotchi)
        return cell
    }
    
    func configureCell(_ cell: DamagotchiCollectionViewCell, with damagotchi: Damagotchi) {
        let imageName = damagotchi.imageName ?? "준비중"
        cell.imageView.image = UIImage(named: imageName)
        cell.imageView.contentMode = .scaleAspectFit
        cell.titleLabel.text = damagotchi.title
        cell.titleLabel.textAlignment = .center
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let damagotchi = Damagotchi.allInstances[indexPath.row]
            //.//showAlert(title: damagotchi.title, message: damagotchi.description)
        showCustomAlert(image: UIImage(named: damagotchi.imageName ?? "준비중"), title: damagotchi.title, message: damagotchi.description)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showCustomAlert(image: UIImage?, title: String, message: String) {
            let alertVC = CustomAlertViewController()
            alertVC.alertImage = image
            alertVC.alertTitle = title
            alertVC.alertMessage = message
            alertVC.modalPresentationStyle = .overCurrentContext
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC, animated: true, completion: nil)
        }
}
