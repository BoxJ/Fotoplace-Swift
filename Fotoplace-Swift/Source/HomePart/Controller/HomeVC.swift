//
//  HomeVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.tag=100
        label.textColor=UIColor.blue
        label.font=UIFont.systemFont(ofSize: 14.0)
        label.textAlignment = .center
        label.numberOfLines=0
        label.text="Alamofire开始发起请求"
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom:iPhone_Height/2.0, right: 0))
        }
        
        let errorLabel = UILabel()
        errorLabel.tag=101
        errorLabel.textColor=UIColor.blue
        errorLabel.font=UIFont.systemFont(ofSize: 14.0)
        errorLabel.textAlignment = .center
        self.view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top:iPhone_Height/2.0, left: 0, bottom:0.0, right: 0))
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let label:UILabel=self.view.viewWithTag(100) as! UILabel
        let errorLabel:UILabel = self.view.viewWithTag(101) as! UILabel
        label.text="Alamofire开始发起请求"
        errorLabel.text="等待返回结果"
        
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
