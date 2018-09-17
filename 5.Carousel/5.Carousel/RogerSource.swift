//
//  RogerSource.swift
//  5.Carousel
//
//  Created by 倩倩 on 2018/9/17.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class RogerSource {
    
    var title = ""
    var description = ""
    var cover: UIImage!
    
    init(title: String, description: String, cover: UIImage!) {
        self.title = title
        self.description = description
        self.cover = cover
    }
    
    static func sources() -> [RogerSource] {
        return [
        RogerSource.init(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "hello")!),
        RogerSource.init(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "dudu")!),
        RogerSource.init(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "bodyline")!),
        RogerSource.init(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "wave")!),
        RogerSource.init(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "darkvarder")!),
        RogerSource.init(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", cover: UIImage(named: "hhhhh")!)
        ]
    }
}
