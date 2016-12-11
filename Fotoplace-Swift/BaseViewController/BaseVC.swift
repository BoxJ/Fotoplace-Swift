//
//  BaseVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initNavigationItem()
    }
    
    func initNavigationItem() {
        let btn1=UIButton(type:.custom)
        btn1.setTitle("三", for: UIControlState.normal)
        btn1.titleLabel?.font=UIFont.systemFont(ofSize: 12.0)
        btn1.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        btn1.titleEdgeInsets=UIEdgeInsetsMake(0.0, 0.0, 0.0, 35.0)
        btn1.setTitleColor(UIColor.blue,for:.normal)
        btn1.addTarget(self, action: #selector(goBack(button:)), for: .touchUpInside)
        let item1=UIBarButtonItem(customView: btn1)
        self.navigationItem.leftBarButtonItem=item1
    }
    func goBack(button:UIButton) {
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        if (myAppdelegate.slider?.isOpen)! {
            myAppdelegate.slider?.closeCompletelyAnimated(true)
        }
        else
        {
            myAppdelegate.slider?.openWithManualCompletelyAnimated(true)
        }
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
