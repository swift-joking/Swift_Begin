//
//  ViewController.swift
//  3.LocalVideo
//
//  Created by 倩倩 on 2018/9/14.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    //MARK:- Variables
    @IBOutlet weak var tableView: UITableView!
    var dataArray = [
        Video(imgName: "videoScreenshot01", titleName: "我我我", sourceName: "你你你你你"),
        Video(imgName: "videoScreenshot02", titleName: "是是是", sourceName: "来来来来来"),
        Video(imgName: "videoScreenshot03", titleName: "一一一", sourceName: "陪陪陪陪陪"),
        Video(imgName: "videoScreenshot04", titleName: "个个个", sourceName: "我我我我我"),
        Video(imgName: "videoScreenshot05", titleName: "蜗蜗蜗", sourceName: "玩玩玩玩玩"),
        Video(imgName: "videoScreenshot06", titleName: "牛牛牛", sourceName: "吧吧吧吧吧")
    ]
    var playVC = AVPlayerViewController()
    var player = AVPlayer()

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK:- Touch Method
    @IBAction func touchPlayBtn(_ sender: Any) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        player = AVPlayer(url: NSURL.fileURL(withPath: path!))
        playVC.player = player
        self.present(playVC, animated: true) {
            self.playVC.player?.play()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.bgImg.image = UIImage(named: dataArray[indexPath.row].imgName)
        cell.title.text = dataArray[indexPath.row].titleName
        cell.source.text = dataArray[indexPath.row].sourceName
        return cell
    }
    
    //MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
