//
//  ViewController.swift
//  10.LoginPlayer
//
//  Created by 倩倩 on 2018/10/8.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ViewController: LoginPlayerViewController {

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        
        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4
        
    }
    
    func setupVideoBackground() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
        
    }


}

