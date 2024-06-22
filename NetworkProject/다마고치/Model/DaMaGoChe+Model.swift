//
//  DaMaGoChe+Model.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/8/24.
//

import UIKit
import SnapKit

struct Damagotchi {
    let imageName: String?
    let title: String
    let description: String

    static let allInstances: [Damagotchi] = {
        var Damagotchis = [
            Damagotchi(imageName: "1-6", title: "따끔따끔 다마고치", description: "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:)"),
            Damagotchi(imageName: "2-6", title: "방실방실 다마고치", description: "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!"),
            Damagotchi(imageName: "3-6", title: "반짝반짝 다마고치", description: "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~")
        ]

        while Damagotchis.count < 30 {
            Damagotchis.append(Damagotchi(imageName: "1-1", title: "준비중", description: "준비중이에요"))
        }

        return Damagotchis
    }()
}
