//
//  PropertyAnimatorManager.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import Foundation

class PropertyAnimatorManager {
    static let shared = PropertyAnimatorManager()
    
    func createPAVC() -> PAViewController {
        let vc = PAViewController.init()
        
        return vc
    }
}
