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
    static let __whiteListUrl = ["api3/account/register","api3/account/login","api3/account/reset","api3/account/bind/mobile/captcha","api/user/splash.do","api3/account/captcha","api3/home/ad/list","api3/home/ad/click","api3/home/ad/show"];
    
    //手机号码登录
    func loginWithMobile(parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let url = host_url + user_mobile_login
        serverRequest(HTTPMethod.post, URLString: url, parameters: parameters, finishedCallback: finishedCallback)
    }
    //第三方登录
    func loginWithThirdPart(thirdPartType : String , parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let url = String(format:host_url + user_thirdPart_login,thirdPartType)
        serverRequest(HTTPMethod.post, URLString: url, parameters: parameters, finishedCallback: finishedCallback)
    }
    
    
    // MARK: - CommonMethods
    func serverRequest(_ type : HTTPMethod, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let headers: HTTPHeaders = getHeader(url: URLString)
        
        Alamofire.request(URLString, method: type, parameters: parameters , headers: headers).responseJSON { (response) in
            guard let result = response.result.value else {
                finishedCallback(["error":response.result.error])
                return
            }
            if ((result as? [String : Any]) != nil) {
                finishedCallback(result)
            }
            else
            {
                finishedCallback(["error":"requestError"])
            }
        }
    }
    
    func getHeader(url:String) -> HTTPHeaders! {
        var Headers=["111":"222"]
        var isWhiteUrl=false
        for urlString in ServerEngine.__whiteListUrl {
            if url.contains(urlString) {
                isWhiteUrl=true
                break
            }
        }
        if isWhiteUrl {
            let timeStamp = CenterControl.shareCenterControl.getTimeStamp()
            let token = "appId=\(FP_APPID)&appUUID=D3A9B4DC-8B6E-433E-A9F0-7188C7F2B713&timestamp=\(timeStamp)".hmac(algorithm: CryptoAlgorithm.SHA256, key: FP_APPSECRET)
            Headers=["Client-Agent":"b35d7751bc8ef46b87892a6abcb8f8/4.3.1/16122020/2/10.2/iPhone 5s (A1457/A1518/A1528/A1530)/D3A9B4DC-8B6E-433E-A9F0-7188C7F2B713","timestamp":timeStamp,"channel":"iOS","TimeZone":"Asia/Shanghai","token":token]
        }
        else
        {
            Headers=["111":"222"]
        }
        return Headers
    }
    
}
