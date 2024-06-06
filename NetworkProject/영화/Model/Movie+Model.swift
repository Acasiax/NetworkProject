//
//  Movie+Model.swift
//  NetworkProject
//
//  Created by 이윤지 on 6/6/24.
//

import UIKit
import SnapKit

struct MoviedataModel {
    let rank: String
    let title: String
    let pubDate: String
}

struct MVdataResponse: Codable {
    let moavieResult: MVdataResult
}

struct MVdataResult: Codable {
    let dailyMVOfficeList: [DailyMVdata]
}

struct DailyMVdata: Codable {
    let rank: String
    let movieTitle: String
    let openDt: String
}
