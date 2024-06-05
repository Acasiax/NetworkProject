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
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
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
