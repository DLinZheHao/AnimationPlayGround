//
//  CAViewController.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import UIKit

class CAViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        blueView.layer.backgroundColor = UIColor.green.cgColor
    }
    
    @IBAction func recoverColor(_ sender: UIButton) {
        blueView.layer.backgroundColor = UIColor.blue.cgColor
    }
    
    @IBAction func giveCornerRadius(_ sender: UIButton) {
        blueView.layer.cornerRadius = blueView.frame.width / 2
    }
    
    @IBAction func recoverConerRadius(_ sender: UIButton) {
        blueView.layer.cornerRadius = 0
    }
    
    @IBAction func giveShadow(_ sender: UIButton) {
        blueView.layer.shadowOpacity = 0.3
        blueView.layer.shadowOffset = CGSize(width: 8, height: 10) // defaults to (0, -3)
        blueView.layer.shadowRadius = 5 // defaults to 3
    }
    
    @IBAction func recoverShadow(_ sender: UIButton) {
        blueView.layer.shadowOpacity = 0
    }
    
    @IBAction func opacityZeroAnimation(_ sender: UIButton) {
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 1.0
        fadeAnim.toValue = 0.0
        fadeAnim.duration = 1.0
        
        blueView.layer.add(fadeAnim, forKey: "fadeAnim")
        blueView.layer.opacity = 0.0
    }
    
    @IBAction func opacityRecover(_ sender: UIButton) {
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = 0.0
        fadeAnim.toValue = 1.0
        fadeAnim.duration = 1.0
        
        blueView.layer.add(fadeAnim, forKey: "fadeAnim")
        blueView.layer.opacity = 1.0
    }
    
    // Using a Keyframe Animation to Change Layer Properties
    @IBAction func moveToRightSide(_ sender: UIButton) {
        let thePath = CGMutablePath()

        // 基本上都是通過 center 進行座標定位
        // 起始點
        thePath.move(to: CGPoint(x: 0, y: 300))

        // 从当前路径的结束点（上一段结束的地方或起始点）开始，沿着一个曲线轨迹移动到坐标 (200, 300) 处
        // 通过 control1 和 control2 参数指定了两个控制点，以确定曲线的形状。
        // 三次贝塞尔曲线
        // control1 控制点 (0, 50) 影响曲线的起始部分，使其弯曲向上。
        // control2 控制点 (200, 50) 影响曲线的结束部分，使其弯曲向上。
        thePath.addCurve(to: CGPoint(x: 200, y: 300),
                         control1: CGPoint(x: 0, y: 50),
                         control2: CGPoint(x: 200, y: 50))
        thePath.addCurve(to: CGPoint(x: 400, y: 300),
                         control1: CGPoint(x: 200, y: 50),
                         control2: CGPoint(x: 400, y: 50))

        let theAnimaton = CAKeyframeAnimation(keyPath: "position")
        theAnimaton.path = thePath
        theAnimaton.duration = 5
        
        self.blueView.layer.add(theAnimaton, forKey: "position")
        self.blueView.center = CGPoint(x: 400, y: 300)
    }
    
    @IBAction func moveToLeftSide(_ sender: UIButton) {
        let thePath = CGMutablePath()
        thePath.move(to: CGPoint(x: 400, y: 300))
        
        thePath.addCurve(to: CGPoint(x: 200, y: 300),
                         control1: CGPoint(x: 400, y: 50),
                         control2: CGPoint(x: 200, y: 50))
        thePath.addCurve(to: CGPoint(x: 0, y: 300),
                         control1: CGPoint(x: 200, y: 50),
                         control2: CGPoint(x: 0, y: 50))

        let theAnimaton = CAKeyframeAnimation(keyPath: "position")
        theAnimaton.path = thePath
        theAnimaton.duration = 5
        
        self.blueView.layer.add(theAnimaton, forKey: "position")
        self.blueView.center = CGPoint(x: 0, y: 300)
    }
    
    // Specifying the Timing of a Keyframe Animation
    @IBAction func animationTimeTest(_ sender: UIButton) {
        let theAnimation = CAKeyframeAnimation(keyPath: "position")
        
        theAnimation.duration = 5;
        theAnimation.values = [
            NSValue(cgPoint: CGPoint(x: 50, y: 100)),
            NSValue(cgPoint: CGPoint(x: 250, y: 100)),
            NSValue(cgPoint: CGPoint(x: 250, y: 300))
        ]
        
        theAnimation.keyTimes = [0, 0.2, 1]
        theAnimation.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        ]
        self.blueView.layer.add(theAnimation, forKey: "position")
    }
    
    // 多個動畫數值同時運行
    @IBAction func groupAnimation(_ sender: UIButton) {
        // Animation 1
        let widthAnim = CAKeyframeAnimation(keyPath: "borderWidth")
        widthAnim.values = [1.0, 10.0, 5.0, 30.0, 0.5, 15.0, 2.0, 50.0, 0.0]
        widthAnim.calculationMode = .paced

        // Animation 2
        let colorAnim = CAKeyframeAnimation(keyPath: "borderColor")
        colorAnim.values = [UIColor.green.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
        colorAnim.calculationMode = .paced

        // Animation group
        let group = CAAnimationGroup()
        group.animations = [colorAnim, widthAnim]
        group.duration = 5.0

        self.blueView.layer.add(group, forKey: "BorderChanges")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
