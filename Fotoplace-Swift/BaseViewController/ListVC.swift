//
//  ListVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class ListVC: BaseVC,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var needHeaderRefresh:Bool!
    var needFooterRefresh:Bool!
    var initWithInsets:Bool!
    var inSets:UIEdgeInsets!
    var tableRect:CGRect!
    var tableStyle:UITableViewStyle!
    
    init(tableInSets:UIEdgeInsets,needToTopRefresh: Bool,needToFooterRefresh:Bool,tableViewStyle:UITableViewStyle) {
        super.init(nibName: nil, bundle: nil)
        self.needHeaderRefresh=needToTopRefresh;
        self.needFooterRefresh=needToFooterRefresh;
        self.tableStyle=tableViewStyle;
        self.inSets=tableInSets;
        self.initWithInsets=true;
    }
    
    init(tableViewFrame:CGRect,needToTopRefresh: Bool,needToFooterRefresh:Bool,tableViewStyle:UITableViewStyle) {
        super.init(nibName: nil, bundle: nil)
        self.needHeaderRefresh=needToTopRefresh;
        self.needFooterRefresh=needToFooterRefresh;
        self.tableStyle=tableViewStyle;
        self.tableRect=tableViewFrame;
        self.initWithInsets=false;
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeTable()
    }
    func makeTable (){
        tableView=UITableView.init(frame: CGRect.zero, style:tableStyle)
        tableView.delegate=self;//实现代理
        tableView.dataSource=self;//实现数据源
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cellIdentifier")
        self.view.addSubview(tableView)
        if (!initWithInsets) {
            tableView.frame=tableRect;
        }
        else
        {
            tableView.snp.makeConstraints({ (make) in
                make.edges.equalTo(inSets)
            })
        }
//        上下拉 刷新
        if (needHeaderRefresh!) {
            setupHeaderRefresh()
        }
        if (needFooterRefresh!) {
            setupFooterRefresh();
        }
        //tableFooter
        tableView.tableFooterView = UIView.init()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func setupHeaderRefresh() {
        
    }
    func setupFooterRefresh() {
        
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
