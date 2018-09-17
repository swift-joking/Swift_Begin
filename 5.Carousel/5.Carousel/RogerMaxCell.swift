//
//  RogerMaxCell.swift
//  5.Carousel
//
//  Created by 倩倩 on 2018/9/17.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class RogerMaxCell: UICollectionViewCell {
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var source: RogerSource! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        title.text = source.description
        cover.image = source.cover
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
