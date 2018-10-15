//
//  ViewController.swift
//  PickerGame
//
//  Created by 倩倩 on 2018/10/15.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var gamePicker: UIPickerView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var resultBtn: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = playBtn.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0...100 {
            self.dataArray1.append((Int)(arc4random() % 10 ))
            self.dataArray2.append((Int)(arc4random() % 10 ))
            self.dataArray3.append((Int)(arc4random() % 10 ))
        }
        
        resultBtn.text = ""
        
        gamePicker.delegate = self
        gamePicker.dataSource = self
        
        playBtn.layer.cornerRadius = 6
    }

    @IBAction func touchPlayBtn(_ sender: Any) {
        gamePicker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        gamePicker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        gamePicker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if(dataArray1[gamePicker.selectedRow(inComponent: 0)] == dataArray2[gamePicker.selectedRow(inComponent: 1)] && dataArray2[gamePicker.selectedRow(inComponent: 1)] == dataArray3[gamePicker.selectedRow(inComponent: 2)]) {
            resultBtn.text = "Bingo!"
        } else {
            resultBtn.text = "💔"
        }
        
        //animate
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.playBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
            
        }, completion: { (compelete: Bool) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions(), animations: {
                
                self.playBtn.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
            }, completion: nil)
            
        })
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
        
    }
}
