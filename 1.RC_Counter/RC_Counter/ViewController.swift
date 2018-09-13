//
//  ViewController.swift
//  RC_Counter
//
//  Created by 倩倩 on 2018/9/12.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

enum CounterStatus {
    case CounterPreparing // 准备计时
    case CounterPlaying // 计时中
    case CounterPausing // 暂停中
}

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var status: CounterStatus = .CounterPreparing {
        willSet {
            // 根据状态调整交互
            switch newValue {
                case .CounterPreparing:
                    playBtn.isEnabled = true
                    pauseBtn.isEnabled = false
                    resetBtn.isEnabled = false
                    
                    counter = 0.0
                    timer.invalidate()
                case .CounterPlaying:
                    playBtn.isEnabled = false
                    pauseBtn.isEnabled = true
                    resetBtn.isEnabled = false
                    
                    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                        self.counter += 0.1;
                    })
                case .CounterPausing:
                    playBtn.isEnabled = true
                    pauseBtn.isEnabled = false
                    resetBtn.isEnabled = true
                    
                    timer.invalidate()
            }
        }
    }
    
    var timer = Timer()
    var counter: Double = 0.0 {
        willSet {
            if newValue >= 0 {
                counterLabel.text = String(format: "%.1f", newValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: Touch Method
    @IBAction func touchPlayBtn(_ sender: UIButton) {
        status = .CounterPlaying
    }
    
    @IBAction func touchPauseBtn(_ sender: UIButton) {
        status = .CounterPausing
    }
    
    @IBAction func touchResetBtn(_ sender: UIButton) {
        status = .CounterPreparing
    }
}

