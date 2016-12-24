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
        serverGet(urlString: url, para: ["size":"60"], completed: completed)
    }
    func getVideoList(pageNo:Int64,completed:((Any?)->(Void))?){
        let url = host_url + video_list
        serverGet(urlString: url, para: ["page":pageNo,"size":"60"], completed: completed)
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
    
    func requestData(_ type : HTTPMethod, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "error")
                return
            }
            finishedCallback(result)
        }
    }
    
}
