//
//  VideoListCell.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit

class VideoListCell: UITableViewCell {

    let imgView:BoxImageView=BoxImageView()
    let likeButton:UIButton=UIButton.init(type: .custom)
    let toHomeButton:UIButton=UIButton.init(type: .custom)
    let toCategoryButton:UIButton=UIButton.init(type: .custom)
    let line:UIView=UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.imgView.backgroundColor=UIColor.black
        self.contentView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: 50.0, right: 0))
        }
        likeButton.titleLabel?.font=UIFont.systemFont(ofSize: 14.0)
        likeButton.setTitleColor(UIColor.blue, for: .normal)
        likeButton.setTitle("点赞", for: .normal)
        toHomeButton.titleLabel?.font=UIFont.systemFont(ofSize: 14.0)
        toHomeButton.setTitleColor(UIColor.blue, for: .normal)
        toHomeButton.setTitle("推荐到首页", for: .normal)
        toCategoryButton.titleLabel?.font=UIFont.systemFont(ofSize: 14.0)
        toCategoryButton.setTitleColor(UIColor.blue, for: .normal)
        toCategoryButton.setTitle("推荐到类别", for: .normal)
        line.backgroundColor=UIColor.lightGray
        self.contentView.addSubview(likeButton)
        self.contentView.addSubview(toHomeButton)
        self.contentView.addSubview(toCategoryButton)
        self.contentView.addSubview(line)
        likeButton.snp.makeConstraints { (make) in
            make.left.equalTo(0.0)
            make.bottom.equalTo(-10.0)
            make.height.equalTo(40.0)
            make.right.equalTo(-iPhone_Width/3.0*2.0)
        }
        toHomeButton.snp.makeConstraints { (make) in
            make.left.equalTo(iPhone_Width/3.0)
            make.bottom.equalTo(-10.0)
            make.height.equalTo(40.0)
            make.right.equalTo(-iPhone_Width/3.0)
        }
        toCategoryButton.snp.makeConstraints { (make) in
            make.left.equalTo(iPhone_Width/3.0*2.0)
            make.bottom.equalTo(-10.0)
            make.height.equalTo(40.0)
            make.right.equalTo(0.0)
        }
        line.snp.makeConstraints { (make) in
            make.left.equalTo(0.0)
            make.bottom.equalTo(0.0)
            make.height.equalTo(10.0)
            make.right.equalTo(0.0)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
