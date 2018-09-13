//
//  ViewController.swift
//  2_FontAnimation
//
//  Created by 倩倩 on 2018/9/13.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeBtn: UIButton!
    
    var contentArray = ["@Roger_Chen_521", "我是中国人", "高顿财经真的是坑", "19370707", "四川省成都市", "Euphemia UCAS Bangla Sangam MN DIN Condensed", "退费都搞的乱七八糟的"]
    
    var fontArray = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    
    var randomIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        changeBtn.layer.cornerRadius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let content = contentArray[indexPath.row]
        cell.textLabel?.text = content
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: fontArray[randomIndex], size: 16)
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: Touch Method
    
    @IBAction func touchChangeFontBtn(_ sender: Any) {
        randomIndex = (randomIndex + 1) % 5
        print(fontArray[randomIndex])
        tableView.reloadData()
    }
}

