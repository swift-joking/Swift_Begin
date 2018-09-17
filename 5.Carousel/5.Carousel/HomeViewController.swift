//
//  ViewController.swift
//  5.Carousel
//
//  Created by 倩倩 on 2018/9/17.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bgImg: UIImageView!
    
    fileprivate var sources = RogerSource.sources()
    
    fileprivate struct Identifiers {
        static let cellIdentifier = "RogerMaxCell"
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
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.cellIdentifier, for: indexPath) as! RogerMaxCell
        cell.source = sources[indexPath.item]
        return cell
    }
}

