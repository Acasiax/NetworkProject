//
//  DaMaGoChe+Model.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/8/24.
//

import UIKit

struct DaMaGoChe {
    let imageName: String?
    let title: String
    let description: String
    
    static let all: [DaMaGoChe] = {
        var daMaGoChes = [
            DaMaGoChe(imageName: "1-6", title: "따끔따끔 다마고치", description: "저는 선인장 다마고치입니다."),
            DaMaGoChe(imageName: "2-6", title: "방실방실 다마고치", description: "저는 방실방실 다마고치입니당 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!"),
            DaMaGoChe(imageName: "3-6", title: "반짝반짝 다마고치", description: "저는 반짝반짝 다마고치에요")
        ]
        while daMaGoChes.count < 30 {
            daMaGoChes.append(DaMaGoChe(imageName: "1-1", title: "준비중", description: "준비중이에요"))
        }
        return daMaGoChes
    }()
}
