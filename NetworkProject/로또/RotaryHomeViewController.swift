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
    let numberTextField: UITextField = .createCustomTextField(placeholder: "회차 번호 입력", keyboardType: .numberPad, textAlignment: .center, borderStyle: .roundedRect)
        
    let checkButton: UIButton = .createCustomButton(title: "확인", target: self, action: #selector(checkButtonClicked))
        
    let resultLabel: UILabel = .createCustomLabel(textAlignment: .center, numberOfLines: 0)
        
    
    var numberCircles: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                setupUI()
       
    }
    
    @objc func checkButtonClicked() {
          print(#function)
        guard let drawNumber = numberTextField.text, !drawNumber.isEmpty else {
                   resultLabel.text = "회차 번호를 입력해주세요."
                   return
               }
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(numberTextField.text!)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let lotto):
                    if lotto.returnValue == "success" {
                        self.resultLabel.text = """
                        \(lotto.drwNoDate) 추첨결과
                        당첨 번호: \(lotto.drwtNo1), \(lotto.drwtNo2), \(lotto.drwtNo3), \(lotto.drwtNo4), \(lotto.drwtNo5), \(lotto.drwtNo6)
                        보너스 번호: \(lotto.bnusNo)
                        """
                        //🔥🔧 삽질
                        self.updateLottoNumbers(lotto: lotto)
                    } else {
                        self.resultLabel.text = "데이터를 불러오는데 실패했습니다."
                    }
                case .failure(let error):
                    print(error)
                    self.resultLabel.text = "데이터를 불러오는데 실패했습니다."
                }
            }
      }
    
    func setupUI() {
          view.addSubview(numberTextField)
          view.addSubview(checkButton)
          view.addSubview(resultLabel)
          
          numberTextField.snp.makeConstraints { make in
              make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
              make.centerX.equalToSuperview()
              make.width.equalTo(200)
              make.height.equalTo(40)
          }
          
          checkButton.snp.makeConstraints { make in
              make.top.equalTo(numberTextField.snp.bottom).offset(10)
              make.centerX.equalToSuperview()
          }
          
          resultLabel.snp.makeConstraints { make in
              make.top.equalTo(checkButton.snp.bottom).offset(20)
              make.left.equalToSuperview().offset(20)
              make.right.equalToSuperview().offset(-20)
          }
        setupNumberCircles()

      }
    
    
    func createCircleView() -> UIView {
           let circleView = UIView()
           circleView.layer.cornerRadius = 21
           circleView.backgroundColor = .lightGray
           
           let numberLabel = UILabel()
        numberLabel.tag = 100
           numberLabel.textAlignment = .center
           numberLabel.textColor = .white
           circleView.addSubview(numberLabel)
           numberLabel.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
           
           return circleView
       }
    func setupNumberCircles() {
         for _ in 0..<7 {
             let circleView = createCircleView()
             numberCircles.append(circleView)
             view.addSubview(circleView)
         }
         
         for (index, circle) in numberCircles.enumerated() {
             circle.snp.makeConstraints { make in
                 make.top.equalTo(resultLabel.snp.bottom).offset(20)
                 make.width.height.equalTo(42)
                 if index == 0 {
                     make.left.equalToSuperview().offset(20)
                 } else {
                     make.left.equalTo(numberCircles[index - 1].snp.right).offset(10)
                 }
             }
         }
     }
    func updateLottoNumbers(lotto: Lotto) {
            let numbers = [lotto.drwtNo1, lotto.drwtNo2, lotto.drwtNo3, lotto.drwtNo4, lotto.drwtNo5, lotto.drwtNo6, lotto.bnusNo]
            
            for (index, number) in numbers.enumerated() {
                if let label = numberCircles[index].viewWithTag(100) as? UILabel {
                    label.text = "\(number)"
                }
            }
        }
}

