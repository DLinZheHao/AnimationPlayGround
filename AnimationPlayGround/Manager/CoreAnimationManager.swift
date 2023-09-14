//
//  CoreAnimationManager.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import UIKit

class CoreAnimationManager {
    static let shared = CoreAnimationManager()
    
    func createCAVC() -> CAViewController {
        let vc = UIStoryboard.coreAnimation.instantiateViewController(
            withIdentifier: CAViewController.identifier
        ) as? CAViewController
        return vc!
    }
    
}
