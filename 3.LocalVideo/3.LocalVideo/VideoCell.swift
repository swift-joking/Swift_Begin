//
//  VideoCell.swift
//  3.LocalVideo
//
//  Created by 倩倩 on 2018/9/14.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

struct Video {
    let imgName: String
    let titleName: String
    let sourceName: String
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var source: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
