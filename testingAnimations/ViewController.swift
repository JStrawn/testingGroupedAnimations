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
        
        // creating the moving image
        let myImageView = UIImageView(frame: CGRect(x: 10, y: view.frame.maxY * 0.10, width: view.frame.width - 20, height: view.frame.height))
        myImageView.image = #imageLiteral(resourceName: "simple-gravestone")
        view.addSubview(myImageView)
        
        // creating a label to appear on image when animation completes
        testLabel = UILabel(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.height / 2, width: 200, height: 30))
        testLabel.text = "Test"
        self.testLabel.isHidden = true
        view.addSubview(testLabel)
        
        // show label when animation is finished
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            self.testLabel.isHidden = false
        })
        
        // first animation moves image along the y axis
        let slideAnimation = CABasicAnimation(keyPath: "position.y")
        slideAnimation.fromValue = self.view.frame.maxY + myImageView.frame.height
        slideAnimation.toValue = self.view.frame.maxY * 0.10 + myImageView.frame.height / 2

        // second animation makes image shake along the x axis
        let shakeAnimation = CABasicAnimation(keyPath: "position.x")
        shakeAnimation.repeatCount = 50
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.06
        shakeAnimation.fromValue = self.view.frame.width/2 + 5
        shakeAnimation.toValue =  self.view.frame.width/2 - 5
        
        // create an animation group
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2.0
        groupAnimation.animations = [slideAnimation, shakeAnimation]

        // add animation group to image
        myImageView.layer.add(groupAnimation, forKey: nil)
        CATransaction.commit()

    }



}

