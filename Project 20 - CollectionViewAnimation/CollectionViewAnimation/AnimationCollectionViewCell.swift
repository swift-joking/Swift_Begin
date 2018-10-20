//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by Patrick Reynolds on 2/15/16.
//  Copyright © 2016 Allen. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    
    var backButtonTapped: (() -> Void)?
    
    func prepareCell(viewModel: AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    private func addTapEventHandler() {
        backButton.addTarget(self, action: Selector(("backButtonDidTouch:")), for: .touchUpInside)
    }
    
    func backButtonDidTouch(sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
}
