//
//  DSPlayViewController.swift
//  AlamofireDemo
//
//  Created by Jay on 2018/1/30.
//  Copyright © 2018年 Jay. All rights reserved.
//

import UIKit
import SnapKit
import WebKit

class DSPlayViewController: DSBaseController {
    
    
    lazy var viewModel = DSMovieViewModel()
    
    var curIndex = 0
    
    
    var model : DS91PlayModel?
    
    lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.mediaPlaybackRequiresUserAction = false//把手动播放设置NO ios(8.0, 9.0)
        config.allowsInlineMediaPlayback = true//是否允许内联(YES)或使用本机全屏控制器(NO)，默认是NO。
        config.mediaPlaybackAllowsAirPlay = true//允许播放，ios(8.0, 9.0)


        let web = WKWebView(frame: CGRect.zero, configuration: config)
        web.backgroundColor = UIColor.black
        web.scrollView.backgroundColor = UIColor.black
        web.scrollView.isScrollEnabled = false
        
        
        return web
    }()

    
    lazy var playView : UIView = {
        let playView = UIView(frame: CGRect(x: 0, y: NavbarHeight, width: kScreenWidth, height: 9 * kScreenWidth / 16.0))
        playView.backgroundColor = UIColor.black
        
        return playView
    }()
    
    lazy var changButton :UIButton = {
       
        let button = UIButton(type: UIButtonType.custom)
        //button.backgroundColor = UIColor.white
        button.setImage(#imageLiteral(resourceName: "change"), for: .normal)
        button.size = CGSize(width: 44, height: 44)
        button.addTarget(self, action: #selector(DSPlayViewController.fullAction(btn:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    deinit {
        webView.scrollView.removeObserver(self, forKeyPath: "contentSize")
    }

}

extension DSPlayViewController{
    @objc fileprivate func fullAction(btn:UIButton){
        let  alert = UIAlertController(title: nil, message: "切换直播源", preferredStyle: .actionSheet)
        for (index , item) in (model?.allURLs.enumerated())! {
            
            var title =  "线路\(index) \t\t"
            
            if index == self.curIndex {
                 title = "线路\(index) ✓"
            }
            
            let action = UIAlertAction(title: title, style: .default, handler: { [weak self](action) in
                self?.changePlay(url: item)
                self?.curIndex = index
            })
            alert.addAction(action)
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
        guard let obj: UIScrollView = object as? UIScrollView else {
            return
        }
        
        if obj == webView.scrollView && keyPath == "contentSize" {
            // we are here because the contentSize of the WebView's scrollview changed.
            
            let scrollView = webView.scrollView;
            playView.height = scrollView.contentSize.height
        }
    }
}

extension DSPlayViewController{
    fileprivate func setUI(){
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(playView)
        playView.addSubview(webView)
        webView.snp.makeConstraints { (make) -> Void in
            make.right.bottom.left.top.equalTo(playView)
        }
        changePlay(url: (model?.allURLs.first)!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: changButton)

        webView.scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    func changePlay(url:String) {
        
        view.showLoading()
        viewModel.getM3u8(url: url, success: {[weak self] (m3u8) in
            self?.view.hideLoading("")
//            let request = URLRequest(url: URL(string: m3u8)!)
//            let request = URLRequest(url: URL(string: m3u8)!), cachePolicy, timeoutInterval: 10)
//            self?.webView.load(request)
//            var m3u8 = "http://acm.gg/inews.m3u8"
            

            let html = "<html><body style=\"margin:0;background-color:#000000;\" ><video style=\"margin:0;background-color:#000000;\" width=\"100%\" controls autoplay playsinline webkit-playsinline  type=\"application/vnd.apple.mpegurl\"><source src=\"\(m3u8)\">当前环境不支持播放</video></body></html>"

            self?.webView.loadHTMLString(html, baseURL:  nil)

            
            print(m3u8)

        }) { [weak self](msg) in
            self?.view.hideLoading(msg)
        }
        
        
    }
}


