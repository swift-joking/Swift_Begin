//
//  DescriptionViewController.swift
//  12.LoginAnimation
//
//  Created by 倩倩 on 2018/10/10.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImg.layer.cornerRadius = 50
        signupBtn.layer.cornerRadius = 10
        loginBtn.layer.cornerRadius = 10
    }

}
