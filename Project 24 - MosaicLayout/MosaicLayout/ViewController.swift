//
//  ViewController.swift
//  MosaicLayout
//
//  Created by Allen on 16/2/1.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit
import FMMosaicLayout

class ViewController: UICollectionViewController, FMMosaicLayoutDelegate {
    
    var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
        
        let mosaicLayout : FMMosaicLayout = FMMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        
        let randomBlue = CGFloat(drand48())
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        
        cell.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        cell.alpha = 0
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
//
//        let cellDelay = UInt64((arc4random() % 600 ) / 1000 )
//
//        dispatch_after(dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(cellDelay * NSEC_PER_SEC )), dispatch_get_main_queue(), ({ () -> Void in
//
//            UIView.animateWithDuration(0.8, animations: ({
//
//                cell.alpha = 1.0
//
//            }))
//
//        }))
        
        return cell
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath? ) -> FMMosaicCellSize {
        return (indexPath?.item)! % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
    
    

    
}

