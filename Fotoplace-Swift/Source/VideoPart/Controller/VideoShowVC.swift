//
//  VideoShowVC.swift
//  Fotoplace-Swift
//
//  Created by jingliang on 2016/12/11.
//  Copyright © 2016年 井良. All rights reserved.
//

import UIKit
let videoUrl = URL(string: "http://fp-testvideo.ks3-cn-beijing.ksyun.com/161128/25610113/a56558d8685cc5c3ce8851070ced457a.mp4")!
class VideoShowVC: ListVC,PlayerDelegate {

    private var player: Player!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView .register(VideoListCell.self, forCellReuseIdentifier:"video")
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection=true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 300;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "video")
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playVideoWith(indexPath:indexPath)
    }
    
    func playVideoWith(indexPath: IndexPath) {
        let videoCell:VideoListCell=self.tableView.cellForRow(at: indexPath) as! VideoListCell
        if (self.player == nil) {
            self.player = Player()
            self.player.delegate = self
            self.addChildViewController(self.player)
            self.player.didMove(toParentViewController: self)
            self.player.playbackLoops = true
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
            tapGestureRecognizer.numberOfTapsRequired = 1
            self.player.view.addGestureRecognizer(tapGestureRecognizer)
        }
        
        videoCell.contentView.addSubview(self.player.view)
        self.player.view.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: 50.0, right: 0))
        }
        self.player.setUrl(videoUrl)
        self.player.playFromBeginning()
        
    }
    
    // MARK: UIGestureRecognizer
    
    func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.stopped.rawValue:
            self.player.playFromBeginning()
        case PlaybackState.paused.rawValue:
            self.player.playFromCurrentTime()
        case PlaybackState.playing.rawValue:
            self.player.pause()
        case PlaybackState.failed.rawValue:
            self.player.pause()
        default:
            self.player.pause()
        }
    }
    // MARK: PlayerDelegate
    
    func playerReady(_ player: Player) {
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
    }
    
    func playerWillComeThroughLoop(_ player: Player) {
        
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
