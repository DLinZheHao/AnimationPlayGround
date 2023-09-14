//
//  UIStoryboard+Extension.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import UIKit

extension UIStoryboard {
    static var coreAnimation: UIStoryboard { return stStoryboard(name: "CoreAnimation") }

    private static func stStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}

