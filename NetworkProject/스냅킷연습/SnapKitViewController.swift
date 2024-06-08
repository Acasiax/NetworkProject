//
//  SnapKitViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/8/24.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //UILabel 생성
        let label = UILabel()
        label.text = "안녕 생성"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        
        //UILabel을 <에드서브>뷰에 추가
        self.view.addSubview(label)
        
        //Snapkit을 사용하여 제약조건 추가
        label.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    


}
