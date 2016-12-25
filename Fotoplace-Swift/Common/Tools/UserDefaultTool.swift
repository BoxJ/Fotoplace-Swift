//
//  UserDefaultTool.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/25.
//  Copyright © 2016年 井良. All rights reserved.
//

import Foundation

let IsFirstLaunch = "IsFirstLaunch"
let UserName = "UserName"
let UserPwd = "UserPwd"

//MARK:------------- LCDUserDefaults
func UserDefaultsUpdate(parameter:[String:String]!) -> Void {
    for key in parameter.keys {
        let stringValue = parameter[key]
        if (stringValue?.lengthOfBytes(using: String.Encoding.utf8))!>0 {
            UserDefaults.standard.set(stringValue, forKey: key)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    UserDefaults.standard.synchronize()
}
func UserDefaultsSet(key:String, obj:AnyObject) -> Void {
    UserDefaults.standard.set(obj, forKey: key)
    UserDefaults.standard.synchronize()
}
func UserDefaultsGet(key:String) -> AnyObject {
    return UserDefaults.standard.value(forKey: key)! as AnyObject
}
func UserDefaultsRemo(key:String) -> Void {
    UserDefaults.standard.removeObject(forKey: key)
}
func UserDefaultsBool(key:String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
}
