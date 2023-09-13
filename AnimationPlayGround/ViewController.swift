//
//  ViewController.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    
    // 動畫執行期間還可以操作，結束後沒有任何效果
    @IBAction func start(_ sender: UIButton) {
        animator.isReversed = false
        animator.startAnimation()
    }
    
    @IBAction func pause(_ sender: UIButton) {
        animator.pauseAnimation()
    }
    
    @IBAction func reverse(_ sender: UIButton) {
        animator.isReversed = true
    }
    
    @IBAction func finsh(_ sender: UIButton) {
        animator.stopAnimation(false)
        // 可調整結束動畫後，動畫的節點
        animator.finishAnimation(at: .end)
    }
    
    // 透過 UISlider
    @IBAction func valueChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    // ------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // runningPropertyAnimator()
        runAnimation()
    }
    
    // 直接創建並且返回一個動畫器，並且該動畫器立即執行動畫（有點類似於之前 UIView.animate 的方式）
    // 動作實作 -> 1. 圓角 2. 透明度 3. y 位置調整 4. 旋轉
    private func runningPropertyAnimator() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 4,
                                                       delay: 0,
                                                       options: .curveEaseInOut,
                                                       animations:
        {
            [unowned self] in
            self.blueView.layer.cornerRadius = self.blueView.frame.width / 2
            self.blueView.alpha = 0.5
            self.blueView.center.y += 200
            self.blueView.transform = CGAffineTransform(rotationAngle: .pi)
        }) {_ in
            print("結束")
        }
    }
    
    // 透過實例化的方式來產生的動畫器，動畫並不會在產生後立即執行，我們必須調用 startAnimation 方法來啟動動畫
    private lazy var animator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 5, curve: .easeInOut)
    }()
    
    private func runAnimation() {
        animator.addAnimations {
            [unowned self] in
            self.blueView.layer.cornerRadius = self.blueView.frame.width / 2
            self.blueView.alpha = 0.5
            self.blueView.center.y += 200
            self.blueView.transform = CGAffineTransform(rotationAngle: .pi)
            self.blueView.backgroundColor = .red
        }
        
        animator.addCompletion { _ in
            print("結束")
        }
        
        // 暂停并恢复动画：当你需要在某个点上暂停动画，并在稍后继续执行时，可以使用 pauseAnimation 方法来暂停动画，然后使用 continueAnimation 方法来恢复它。这对于创建交互式动画或在用户交互期间暂停动画非常有用。
        // 创建连续的动画序列：你可以使用 animator.continueAnimation 来创建一系列依次执行的动画。当一个动画完成后，你可以使用该方法触发下一个动画
        animator.continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 0.5), durationFactor: 1)
        
        animator.startAnimation()
    }
    
    
    
}

