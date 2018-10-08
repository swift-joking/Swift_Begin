//
//  LoginPlayerViewController.swift
//  10.LoginPlayer
//
//  Created by 倩倩 on 2018/10/8.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

open class LoginPlayerViewController: UIViewController {

    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    open var contentURL: URL? {
        didSet {
            if let _contentURL = contentURL {
                setMoviePlayer(_contentURL)
            }
        }
    }
    
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    open var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    open var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    open var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(LoginPlayerViewController.playerItemDidReachEnd),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: moviePlayer.player?.currentItem)
            }
        }
    }
    open var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            }
        }
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setMoviePlayer(_ url: URL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as URL? {
                self.moviePlayer.player = AVPlayer(url: path)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
    }

    

}
