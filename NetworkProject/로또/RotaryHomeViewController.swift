//
//  RotaryHomeViewController.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class RotaryHomeViewController: UIViewController {

    struct Lotto: Decodable {
         let drwNoDate: String
         let drwtNo1: Int
         let drwtNo2: Int
         let drwtNo3: Int
         let drwtNo4: Int
         let drwtNo5: Int
         let drwtNo6: Int
         let bnusNo: Int
         let returnValue: String
     }
    let numberTextField: UITextField = {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.placeholder = "회차 번호 입력"
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            return textField
        }()
        
        let checkButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("확인", for: .normal)
            button.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
            return button
        }()
        
        let resultLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                setupUI()
       
    }
    
    @objc func checkButtonClicked() {
          print(#function)
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(numberTextField.text!)"
         AF.request(url).responseDecodable(of: Lotto.self) { response in
              switch response.result {
              case .success(let value):
                  print(value)
                  self.resultLabel.text = "\(value.drwNoDate)\n1등 당첨금액: \(value.totSellamnt.formatted())원"
              case .failure(let error):
                  print(error)
                  self.resultLabel.text = "데이터를 불러오는데 실패했습니다."
              }
          }
      }
}
