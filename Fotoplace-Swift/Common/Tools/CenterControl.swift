//
//  CenterControl.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/25.
//  Copyright © 2016年 井良. All rights reserved.
//

import Foundation
class CenterControl:NSObject{
    static let shareCenterControl = CenterControl()
    func getTimeStamp() -> String {
        //获取当前时间
        let now = NSDate()
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Double(timeInterval)
        return "\(timeStamp)"
    }
}
