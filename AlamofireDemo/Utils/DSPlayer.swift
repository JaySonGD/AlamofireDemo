//
//  DSPlayer.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/2/6.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit



class DSPlayer: NSObject {

    
    let status = [" 未知状态","正在准备播放所需组件，在调用 -play 方法时出现。",
                 "播放组件准备完成，准备开始播放，在调用 -play 方法时出现。",
                 "缓存数据为空状态",
                 "正在播放状态",
                 "暂停状态",
                 "停止状态",
                 "错误状态，"
                ]

    
    static let share =  DSPlayer()
    private override init() {}
    
    
      // MARK: - <属性>
    var reconnectCount = 0
    var itemIndex = 0
    var currenttModel : DSListModel?
    var playerCompletionBlock : (()->())?
    var playerLoadingBlock : (()->())?

    
    lazy var player: PLPlayer? = {
        let option = PLPlayerOption.default()
        option.setOptionValue(15, forKey: PLPlayerOptionKeyTimeoutIntervalForMediaPackets)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        let liveurl = URL(string: "")
        let player = PLPlayer(url: liveurl, option: option)
        player?.isBackgroundPlayEnable = true
        player?.delegate = self

        return player
    }()
    
    var isPlaying : Bool  {
        return (self.player?.isPlaying)!
    }
}

extension DSPlayer{
    
    
    func play(model:DSListModel) {
        currenttModel = model
        self.player?.play(with: URL(string: model.m3u8))
    }
    
    func stop()  {
        self.player?.stop()
    }

    func pause()  {
        self.player?.setVolume(0.0)
    }
    func play()  {
        self.player?.setVolume(1.0)
    }
    


}

extension DSPlayer : PLPlayerDelegate{
    
    func player(_ player: PLPlayer, statusDidChange state: PLPlayerStatus) {
        // 这里会返回流的各种状态，你可以根据状态做 UI 定制及各类其他业务操作
        // 除了 Error 状态，其他状态都会回调这个方法
        // 开始播放，当连接成功后，将收到第一个 PLPlayerStatusCaching 状态
        // 第一帧渲染后，将收到第一个 PLPlayerStatusPlaying 状态
        // 播放过程中出现卡顿时，将收到 PLPlayerStatusCaching 状态
        // 卡顿结束后，将收到 PLPlayerStatusPlaying 状态
        
        if PLPlayerStatus.statusPlaying == state {
            playerCompletionBlock == nil ?  () : playerCompletionBlock!()
        }else if PLPlayerStatus.statusReady == state {
            playerCompletionBlock == nil ?  () : playerCompletionBlock!()
        }else if PLPlayerStatus.statusError == state {
            playerLoadingBlock == nil ?  () : playerLoadingBlock!()

        }else if (PLPlayerStatus.statusPaused == state) {
            self.player?.play()
        }
        
        print(status[state.rawValue])

    }
    
    func tryReconnect(error:Error?)  {
        if reconnectCount < 3 {
            reconnectCount  = reconnectCount + 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.player?.play()
            })
        }
    }
    
    func player(_ player: PLPlayer, codecError error: Error) {
        print(error)
    }
    
    func player(_ player: PLPlayer, stoppedWithError error: Error?) {
        print(error)
        playerLoadingBlock == nil ?  () : playerLoadingBlock!()
        tryReconnect(error: error)
    }
}
