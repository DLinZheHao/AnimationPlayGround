//
//  UITableViewCell+Extension.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    
    static var identifier: String {
        return String(describing: self)
    }
}
