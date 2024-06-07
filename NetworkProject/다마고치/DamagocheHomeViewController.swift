//
//  DamagocheHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/7/24.
//

import UIKit

class DamagocheHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

}

extension DamagocheHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GOCHECollectionViewCell.identifier, for: indexPath) as! GOCHECollectionViewCell
        return cell
    }
    
    
}
