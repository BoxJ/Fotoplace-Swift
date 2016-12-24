//
//  LoginVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/24.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    private var userNameTf: UITextField!
    private var pwdTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoginView()
        // Do any additional setup after loading the view.
    }

    func initLoginView()
    {
        userNameTf=UITextField.init()
        userNameTf.backgroundColor = .white
        userNameTf.textColor = .gray
        userNameTf.font = .systemFont(ofSize: 14.0)
        userNameTf.textAlignment = .center
        userNameTf.layer.borderColor=UIColor.gray.cgColor
        userNameTf.layer.borderWidth=1.0
        userNameTf.layer.cornerRadius=3.0
        userNameTf.placeholder="请输入中国手机号码"
        self.view .addSubview(userNameTf)
        
        pwdTf=UITextField.init()
        pwdTf.backgroundColor = .white
        pwdTf.textColor = .gray
        pwdTf.font = .systemFont(ofSize: 14.0)
        pwdTf.textAlignment = .center
        pwdTf.layer.borderColor=UIColor.gray.cgColor
        pwdTf.layer.borderWidth=1.0
        pwdTf.layer.cornerRadius=3.0
        pwdTf.placeholder="请输入密码"
        self.view.addSubview(pwdTf)
        
        let button = UIButton(type: .custom)
        button.setTitle("嘿嘿,走起", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 14.0)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        button.layer.cornerRadius=5.0
        self.view.addSubview(button)
        
        userNameTf.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60.0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-80.0)
            make.height.equalTo(36.0)
        }
        
        pwdTf.snp.makeConstraints { (make) in
            make.top.equalTo(userNameTf.snp.bottom).offset(30.0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-80.0)
            make.height.equalTo(36.0)
        }
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTf.snp.bottom).offset(30.0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-80.0)
            make.height.equalTo(36.0)
        }
        
        let isWeChatInstalled = ShareSDK.isClientInstalled(SSDKPlatformType.typeWechat)
        let itemWidth:CGFloat=40.0
        let itemHeight:CGFloat=30.0
        let itemOffset:CGFloat = 10.0
        var imageArr:NSArray
        if (isWeChatInstalled) {
            imageArr=["wechat","weibo","qq"]
        }
        else
        {
            imageArr=["weibo","qq"]
        }
        let xStart=(iPhone_Width - (CGFloat)(imageArr.count) * itemWidth - ((CGFloat)(imageArr.count) - 1) * itemOffset) / 2.0
        for i in 0..<imageArr.count {
            let thirdButton = UIButton(type: .custom)
            thirdButton.tag=100+i;
            thirdButton.setImage(UIImage(named: imageArr[i] as! String), for: UIControlState.normal)
            thirdButton.frame=CGRect.init(x: xStart+(itemWidth+itemOffset)*(CGFloat)(i), y: 240.0, width: itemWidth, height: itemHeight)
            thirdButton.addTarget(self, action: #selector(btnClick(sender:)), for:
                .touchUpInside)
            self.view.addSubview(thirdButton)
        }
    }
    func clickAction(){
        
    }
    func btnClick(sender:UIButton?) {
        let isWeChatInstalled = ShareSDK.isClientInstalled(SSDKPlatformType.typeWechat)
        let tags = sender?.tag
        switch tags! {
        case 100:
            if isWeChatInstalled {
                
            }
            else
            {
                
            }
            break
        case 101:
            if isWeChatInstalled {
                
            }
            else
            {
                
            }
            break
        case 102:
            
            break
            
        default: break
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
