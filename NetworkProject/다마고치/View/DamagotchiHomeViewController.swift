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
      
    }
}
