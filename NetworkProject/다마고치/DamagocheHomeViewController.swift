//
//  DamagocheHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/7/24.
//

import UIKit

class DamagocheHomeViewController: UIViewController {
    
    let mainCollectionView: UICollectionView
    
    init() {
           let layout = UICollectionViewFlowLayout()
           layout.itemSize = CGSize(width: 100, height: 100)
           mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           super.init(nibName: nil, bundle: nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:)가 오류가 났습니다")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
      
    }
    func configureCollectionView() {
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.backgroundColor = .white
        mainCollectionView.register(DaMaGoCheCollectionViewCell.self, forCellWithReuseIdentifier: "gotchCell")
    }

}

extension DamagocheHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gotchCell", for: indexPath) as! DaMaGoCheCollectionViewCell
        return cell
    }
    
    
}
