//
//  TrendeHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/22/24.
//

import UIKit
import SnapKit
import Alamofire

struct TrendeModel {
    let date: String
    let genre: String
    let rating: Double
    let title: String
    let image: UIImage
}

class TrendeHomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView?

    private var models = [TrendeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureModels()
        configureCollectionView()
    }

    private func configureModels() {
    //더미 데이터
        models.append(TrendeModel(date: "12/10/2020", genre: "#Mystery", rating: 3.3, title: "까꿍", image: UIImage(named: "더퍼스트슬램덩크")!))
        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
        models.append(TrendeModel(date: "09/29/2021", genre: "#Crime", rating: 3.3, title: "까꿍2", image: UIImage(named: "더퍼스트슬램덩크")!))
    }

    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(TrendeCollectionViewCell.self, forCellWithReuseIdentifier: TrendeCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendeCollectionViewCell.identifier, for: indexPath) as! TrendeCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width-20, height: 220)
    }
}
