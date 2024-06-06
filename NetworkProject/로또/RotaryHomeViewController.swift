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
    
    let checkButton: UIButton = .createCustomButton(title: "결과 확인", target: self, action: #selector(checkButtonClicked))
    
    let resultLabel: UILabel = .createCustomLabel(textAlignment: .center, numberOfLines: 0)
    let infoLabel: UILabel = .createCustomLabel(text: "당첨 번호 안내", textAlignment: .left, numberOfLines: 1)
    let drawResultLabel: UILabel = .createCustomLabel(textAlignment: .center, numberOfLines: 1)
    let dateLabel: UILabel = .createCustomLabel(text: "추첨 날짜", textAlignment: .right, numberOfLines: 1)
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var numberCircles: [UIView] = []
    let pickerView = UIPickerView()
    let drawNumbers = Array(1...1000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
                setupUI()
        setupPickerView()
        setupGestureRecognizer()
        numberTextField.text = "893"
               if let row = drawNumbers.firstIndex(of: 893) {
                   pickerView.selectRow(row, inComponent: 0, animated: false)
               }
    }
    
    func setupPickerView() {
           pickerView.delegate = self
           pickerView.dataSource = self
           numberTextField.inputView = pickerView
       }
    
    @objc func checkButtonClicked() {
          print(#function)
        guard let drawNumber = numberTextField.text, !drawNumber.isEmpty else {
                   resultLabel.text = "회차 번호를 입력해주세요."
                   return
               }
        let url = "\(APIURL.lottoURL)\(numberTextField.text!)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let lotto):
                    if lotto.returnValue == "success" {

                        self.resultLabel.text = """
                        
                        보너스 번호: \(lotto.bnusNo)
                        """
                        //🔥🔧 삽질
                        self.dateLabel.text = "\(lotto.drwNoDate) 추첨"
                        self.updateLottoNumbers(lotto: lotto)
                       // self.drawNumbers.textColor = .orange
                        self.drawResultLabel.text = "\(drawNumber)회 당첨결과"
                        self.drawResultLabel.font = .systemFont(ofSize: 22)
                    } else {
                        self.resultLabel.text = "데이터를 불러오는데 실패했습니다."
                    }
                case .failure(let error):
                    print(error)
                    self.resultLabel.text = "데이터를 불러오는데 실패했습니다."
                }
            }
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
                 make.top.equalTo(resultLabel.snp.bottom).offset(70)
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
                switch number {
                case 1...10:
                    numberCircles[index].backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.04, alpha: 1.00)
                    label.textColor = .white
                case 11...19:
                    numberCircles[index].backgroundColor = UIColor(red: 1.00, green: 0.30, blue: 0.43, alpha: 1.00)
                    label.textColor = .white
                case 20...40:
                    numberCircles[index].backgroundColor = UIColor(red: 0.64, green: 0.82, blue: 1.00, alpha: 1.00)
                    label.textColor = .white
                default:
                    numberCircles[index].backgroundColor = .lightGray
                    label.textColor = .white
                }
            }
        }
    }
    func setupGestureRecognizer() {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
          view.addGestureRecognizer(tapGesture)
      }
      
      @objc func dismissKeyboard() {
          view.endEditing(true)
      }
      
}


extension RotaryHomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return drawNumbers.count
      }
      
      // UIPickerViewDelegate
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return String(drawNumbers[row])
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          numberTextField.text = String(drawNumbers[row])
      }
    
    
    
}
