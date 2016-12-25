//
//  Dictionary+Extension.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/25.
//  Copyright © 2016年 井良. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension Dictionary {
    
    
//    public func validateError() -> Bool {
//        let value:String = self["22"] as? String
//        if  value.isEmpty {
//            
//        }else{
//            
//        }
//        return true
//    }
    
    /// SwifterSwift: Check if key exists in dictionary.
    ///
    /// - Parameter key: key to search for
    /// - Returns: true if key exists in dictionary.
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    /// SwifterSwift: JSON Data from dictionary.
    ///
    /// - Parameter prettify: set true to prettify data (default is false).
    /// - Returns: optional JSON Data (if applicable).
    public func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return jsonData
        } catch {
            return nil
        }
    }
    
    /// SwifterSwift: JSON String from dictionary.
    ///
    /// - Parameter prettify: set true to prettify string (default is false).
    /// - Returns: optional JSON String (if applicable).
    public func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
}


// MARK: - Methods (ExpressibleByStringLiteral)
public extension Dictionary where Key: ExpressibleByStringLiteral {
    
    /// SwifterSwift: Lowercase all keys in dictionary.
    public mutating func lowercaseAllKeys() {
        // http://stackoverflow.com/questions/33180028/extend-dictionary-where-key-is-of-type-string
        for key in self.keys {
            if let lowercaseKey = String(describing: key).lowercased() as? Key {
                self[lowercaseKey] = self.removeValue(forKey: key)
            }
        }
    }
    
}
