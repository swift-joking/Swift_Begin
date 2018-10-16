//
//  MainViewController.swift
//  17.ItemMenu
//
//  Created by 倩倩 on 2018/10/16.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    

    func unwindToMainViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
