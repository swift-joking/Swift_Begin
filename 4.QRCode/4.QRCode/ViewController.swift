//
//  ViewController.swift
//  4.QRCode
//
//  Created by 倩倩 on 2018/9/15.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var qrView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configInterface()
        addCaptureDevice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    //MARK:- Interface
    func configInterface() {
        qrView.layer.borderColor = UIColor.red.cgColor
        qrView.layer.borderWidth = 2
        view.bringSubview(toFront: qrView)
        resetBtn.isHidden = true
    }
    
    func addCaptureDevice() {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            //初始化媒体捕捉的输入流
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            //初始化AVcaptureSession
            captureSession = AVCaptureSession()
            //设置输入到Session
            captureSession?.addInput(input)
        } catch {
            // 捕获到移除就退出
            print(error)
            return
        }
        
        let output = AVCaptureMetadataOutput()
        captureSession?.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = qrView.layer.bounds
        videoPreviewLayer?.cornerRadius = 20
        qrView.layer.cornerRadius = 20
        qrView.layer.addSublayer(videoPreviewLayer!)
        captureSession?.startRunning()
    }
    
    //MARK:- Touch Method
    @IBAction func touchResetBtn(_ sender: Any) {
        captureSession?.startRunning()
        desLabel.text = ""
        resetBtn.isHidden = true
    }
}

extension ViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            if metadataObj.stringValue != nil {
                captureSession?.stopRunning()
                print(metadataObj.stringValue!)
                desLabel.text = metadataObj.stringValue!
                resetBtn.isHidden = false
            }
        }
        
    }
}

