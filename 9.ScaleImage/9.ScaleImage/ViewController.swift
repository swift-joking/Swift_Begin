//
//  ViewController.swift
//  9.ScaleImage
//
//  Created by 倩倩 on 2018/9/26.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollImage: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //每次控制器更新其子视图时，更新最小缩放比例
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    // MARK:- UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //当手势动作发生时，scrollView告诉控制器要放大或缩小子视图imageView
        return scrollImage
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }

    // MARK:- Private Method
    //当scrollView的内容大小小于边界时，内容将放置在左上角而不是中心，updateConstraintForSize方法处理这个问题；通过调整图像视图的布局约束。
    fileprivate func updateConstraintsForSize(_ size: CGSize) {
        
        //将图像垂直居中，从视图高度减去imageView的高度并分成两半，这个值用作顶部和底部imageView的约束
        let yOffset = max(0, (size.height - scrollImage.frame.height) / 2)
        top.constant = yOffset
        bottom.constant = yOffset
        
        ////根据宽度计算imageView前后约束的偏移量
        let xOffset = max(0, (size.width - scrollImage.frame.width) / 2)
        left.constant = xOffset
        right.constant = xOffset
        
        view.layoutIfNeeded()
    }
    
    //计算scrollView的缩放比例，缩放比例为1表示内容以正常大小显示；缩放比例小于1表示容器内的内容缩小，缩放比例大于1表示放大容器内的内容
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize)
    {
        //要获得最小的缩放比例，首先计算所需的缩放比例，以便根据其宽度在scrollView中紧贴imageView
        let widthScale = size.width / scrollImage.bounds.width
        let heightScale = size.height / scrollImage.bounds.height
        //选取宽度和高度比例中最小的那个,设置为minimumZoomScale
        let minScale = min(widthScale,heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
}

