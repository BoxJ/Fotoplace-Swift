//
//  ServerEngine.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import Foundation
import Alamofire

class ServerEngine: NSObject {
    /// 单例
    static let shareServerEngine = ServerEngine()
    func getSplash(completed:((Any?)->(Void))?){
        let url = host_url + user_splash
        serverGet(urlString: url, para: ["version":"1.0.0"], completed: completed)
    }
    func getUserInfo(completed:((Any?)->(Void))?){
        let url = host_url + user_info
        Alamofire.request(url).responseJSON { (DataResponse) in
            if let Json = DataResponse.result.value{
                completed?(Json)
            }
            else
            {
                completed?(["error": "Request Error"])
            }
        }
    }
    func getVideoList(pageNo:Int64,completed:((Any?)->(Void))?){
        let url = host_url + video_list
        serverGet(urlString: url, para: ["page":pageNo,"size":"60"], completed: completed)
//        Alamofire.request(url, method: .get, parameters: ["page":pageNo,"size":"60"]).responseJSON { (response) in
//            if let Json = response.result.value{
//                completed?(Json)
//            }
//            else
//            {
//                completed?(["error": "Request Error"])
//            }
//        }
    }
    
    // MARK: - CommonMethods
    func serverGet(urlString:String,para:Dictionary<String, Any>,completed:((Any?)->(Void))?) {
        Alamofire.request(urlString).responseJSON { (DataResponse) in
            if let Json = DataResponse.result.value{
                completed?(Json)
            }
            else
            {
                completed?(["error": "Request Error"])
            }
        }
    }
    func serverPost(urlString:String,para:Dictionary<String, Any>,completed:((Any?)->(Void))?) {
//        Alamofire.request(urlString,.post,para,UTF8,["error": "Request Error"]).responseJSON { (DataResponse) in
//            if let Json = DataResponse.result.value{
//                completed?(Json)
//            }
//            else
//            {
//                completed?(["error": "Request Error"])
//            }
//        }
    }
}
