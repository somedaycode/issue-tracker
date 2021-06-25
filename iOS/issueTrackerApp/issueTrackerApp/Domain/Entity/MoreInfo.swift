//
//  MoreInfo.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/12.
//

import Foundation

protocol MoreInfoType {
    func updateInfo(id:Int, info: String)
}

class MoreInfo: Decodable, MoreInfoType {
    var title: String
    var info: String
    var id: Int
    
    init(title: String, info: String, id: Int = 0) {
        self.title = title
        self.info = info
        self.id = id
    }
    
    func updateInfo(id: Int, info: String) {
        self.id = id
        self.info = info
    }
}

extension MoreInfo {
    static let EMPTY = [MoreInfo(title: "레이블", info: ""),
                        MoreInfo(title: "마일스톤", info: ""),
                        MoreInfo(title: "담당자", info: "")
                        ]
}


