//
//  DrawerLeftMenuVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit
typealias TableViewControllerBlock = (Int)->()
class DrawerLeftMenuVC: ListVC {
    var selectEvent: TableViewControllerBlock?
    let items = ["广场","图片","视频"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.delegate = self;
//        self.tableView.dataSource = self;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectEvent?(indexPath.row)
        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
        myAppdelegate.slider?.closeCompletelyAnimated(true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
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
