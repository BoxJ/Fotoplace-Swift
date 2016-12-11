//
//  BoxImageView.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class BoxImageView: UIImageView {

    func setImageWithImageUrlString(url: String) {
        self.layer.removeAnimation(forKey: "easyinout")
        let transition = CATransition();
        transition.type = kCATransitionFade;
        transition.duration = 0.8
        transition.subtype = kCAMediaTimingFunctionEaseInEaseOut
        self.layer.add(transition, forKey: "easyinout")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
