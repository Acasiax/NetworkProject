//
//  DaMaGoChe+Model.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/8/24.
//

import UIKit
import SnapKit

struct Damagotchi {
    var imageName: String?
    var title: String
    var description: String
    var speech: String

    static var group1: [Damagotchi] = [
        Damagotchi(imageName: "1-1", title: "따끔따끔 다마고치", description: "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:)", speech: "저는 따끔따끔 다마고치에요! 열심히 먹고 잘 클게요!"),
        Damagotchi(imageName: "1-2", title: "다마고치 1-2", description: "저는 다마고치 1-2입니다.", speech: "저는 다마고치 1-2에요. 더 잘 자라려면 밥을 더 주세요!"),
        Damagotchi(imageName: "1-3", title: "다마고치 1-3", description: "저는 다마고치 1-3입니다.", speech: "저는 다마고치 1-3입니다. 물을 주시면 더 잘 클 수 있어요!"),
        Damagotchi(imageName: "1-4", title: "다마고치 1-4", description: "저는 다마고치 1-4입니다.", speech: "저는 다마고치 1-4입니다. 더 많이 먹고 싶어요!"),
        Damagotchi(imageName: "1-5", title: "다마고치 1-5", description: "저는 다마고치 1-5입니다.", speech: "저는 다마고치 1-5입니다. 물을 주세요!"),
        Damagotchi(imageName: "1-6", title: "다마고치 1-6", description: "저는 다마고치 1-6입니다.", speech: "저는 다마고치 1-6입니다. 밥을 더 주세요!"),
        Damagotchi(imageName: "1-7", title: "다마고치 1-7", description: "저는 다마고치 1-7입니다.", speech: "저는 다마고치 1-7입니다. 열심히 잘 크고 있어요!"),
        Damagotchi(imageName: "1-8", title: "다마고치 1-8", description: "저는 다마고치 1-8입니다.", speech: "저는 다마고치 1-8입니다. 밥과 물이 필요해요!"),
        Damagotchi(imageName: "1-9", title: "다마고치 1-9", description: "저는 다마고치 1-9입니다.", speech: "저는 다마고치 1-9입니다. 더 많이 먹고 싶어요!")
    ]

    static var group2: [Damagotchi] = [
        Damagotchi(imageName: "2-1", title: "방실방실 다마고치", description: "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!", speech: "방실방실! 저는 더 많이 먹고 싶어요!"),
        Damagotchi(imageName: "2-2", title: "다마고치 2-2", description: "저는 다마고치 2-2입니다.", speech: "저는 다마고치 2-2입니다. 더 잘 자라려면 밥을 주세요!"),
        Damagotchi(imageName: "2-3", title: "다마고치 2-3", description: "저는 다마고치 2-3입니다.", speech: "저는 다마고치 2-3입니다. 물을 주세요!"),
        Damagotchi(imageName: "2-4", title: "다마고치 2-4", description: "저는 다마고치 2-4입니다.", speech: "저는 다마고치 2-4입니다. 더 많이 먹고 싶어요!"),
        Damagotchi(imageName: "2-5", title: "다마고치 2-5", description: "저는 다마고치 2-5입니다.", speech: "저는 다마고치 2-5입니다. 밥과 물을 주세요!"),
        Damagotchi(imageName: "2-6", title: "다마고치 2-6", description: "저는 다마고치 2-6입니다.", speech: "저는 다마고치 2-6입니다. 열심히 잘 크고 있어요!"),
        Damagotchi(imageName: "2-7", title: "다마고치 2-7", description: "저는 다마고치 2-7입니다.", speech: "저는 다마고치 2-7입니다. 밥이 필요해요!"),
        Damagotchi(imageName: "2-8", title: "다마고치 2-8", description: "저는 다마고치 2-8입니다.", speech: "저는 다마고치 2-8입니다. 물이 필요해요!"),
        Damagotchi(imageName: "2-9", title: "다마고치 2-9", description: "저는 다마고치 2-9입니다.", speech: "저는 다마고치 2-9입니다. 더 많이 먹고 싶어요!")
    ]

    static var group3: [Damagotchi] = [
        Damagotchi(imageName: "3-1", title: "반짝반짝 다마고치", description: "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~", speech: "반짝반짝! 저는 더 잘 클 수 있어요!"),
        Damagotchi(imageName: "3-2", title: "다마고치 3-2", description: "저는 다마고치 3-2입니다.", speech: "저는 다마고치 3-2입니다. 더 많이 먹고 싶어요!"),
        Damagotchi(imageName: "3-3", title: "다마고치 3-3", description: "저는 다마고치 3-3입니다.", speech: "저는 다마고치 3-3입니다. 물을 주세요!"),
        Damagotchi(imageName: "3-4", title: "다마고치 3-4", description: "저는 다마고치 3-4입니다.", speech: "저는 다마고치 3-4입니다. 밥을 주세요!"),
        Damagotchi(imageName: "3-5", title: "다마고치 3-5", description: "저는 다마고치 3-5입니다.", speech: "저는 다마고치 3-5입니다. 더 잘 클게요!"),
        Damagotchi(imageName: "3-6", title: "다마고치 3-6", description: "저는 다마고치 3-6입니다.", speech: "저는 다마고치 3-6입니다. 물과 밥이 필요해요!"),
        Damagotchi(imageName: "3-7", title: "다마고치 3-7", description: "저는 다마고치 3-7입니다.", speech: "저는 다마고치 3-7입니다. 열심히 잘 먹고 자랄게요!"),
        Damagotchi(imageName: "3-8", title: "다마고치 3-8", description: "저는 다마고치 3-8입니다.", speech: "저는 다마고치 3-8입니다. 물을 주세요!"),
        Damagotchi(imageName: "3-9", title: "다마고치 3-9", description: "저는 다마고치 3-9입니다.", speech: "저는 다마고치 3-9입니다. 더 많이 먹고 싶어요!")
    ]

    static var allGroups: [[Damagotchi]] = [group1, group2, group3]

    static func getFirstItems() -> [Damagotchi] {
        return allGroups.compactMap { $0.first }
    }
}
