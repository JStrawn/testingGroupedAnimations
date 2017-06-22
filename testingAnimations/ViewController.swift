//
//  ViewController.swift
//  testingAnimations
//
//  Created by Juliana Strawn on 6/7/17.
//  Copyright © 2017 JStrawn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
    
        let myImageView = UIImageView(frame: CGRect(x: 10, y: view.frame.maxY * 0.10, width: view.frame.width - 20, height: view.frame.height))
        myImageView.image = #imageLiteral(resourceName: "simple-gravestone")
        view.addSubview(myImageView)
        
        
        testLabel = UILabel(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.height / 2, width: 200, height: 30))
        testLabel.text = "Test"
        self.testLabel.isHidden = true
        view.addSubview(testLabel)
        
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.testLabel.isHidden = false
        })
        
        
        let slideAnimation = CABasicAnimation(keyPath: "position.y")
        slideAnimation.fromValue = self.view.frame.maxY + myImageView.frame.height
        slideAnimation.toValue = self.view.frame.maxY * 0.10 + myImageView.frame.height / 2

        
        let shakeAnimation = CABasicAnimation(keyPath: "position.x")
        shakeAnimation.repeatCount = 50
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.06
        shakeAnimation.fromValue = self.view.frame.width/2 + 5
        shakeAnimation.toValue =  self.view.frame.width/2 - 5
        
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2.0
        groupAnimation.animations = [slideAnimation, shakeAnimation]

        myImageView.layer.add(groupAnimation, forKey: nil)
        CATransaction.commit()

    }



}

