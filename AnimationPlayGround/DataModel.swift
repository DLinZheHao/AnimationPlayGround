//
//  DataModel.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import Foundation

enum DataType: String {
    case uvpa = "PropertyAnimator"
    case ca = "CoreAnimation"
}

struct DataModel {
    let name: String
    let type: DataType
}
