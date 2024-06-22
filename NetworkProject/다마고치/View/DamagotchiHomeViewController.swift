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
       
    }
    func setupViews() {
        headerLabel.text = "타마고치 선택하기"
        headerLabel.textAlignment = .center
        view.addSubview(headerLabel)
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }

}

extension DamagotchiHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
    
}
