//
//  ViewController.swift
//  12.LoginAnimation
//
//  Created by 倩倩 on 2018/10/9.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var accountHorizonLayout: NSLayoutConstraint!
    
    @IBOutlet weak var pwdHorizonLayout: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginBtn.alpha = 0.0
        accountHorizonLayout.constant -= view.bounds.width
        pwdHorizonLayout.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.accountHorizonLayout.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.pwdHorizonLayout.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginBtn.alpha = 1.0
        }, completion: nil)
    }
    
    @IBAction func touchLoginBtn(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        let bounds = loginBtn.bounds
        
        //Animate
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveLinear, animations: {
            
            self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginBtn.isEnabled = false
            
        }, completion: { finished in self.loginBtn.isEnabled = true })
    }
    
}

