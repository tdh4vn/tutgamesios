//
//  DetailViewController.swift
//  Rules of Survival Guide
//
//  Created by HungTran on 3/11/18.
//

import Foundation
//
//  ViewController.swift
//  Rules of Survival Guide
//
//  Created by HungTran on 3/11/18.
//

import UIKit
import QuartzCore
import YouTubePlayer

class DetailViewController: UIViewController {
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var btnBack: UIButton!
    public var index: Int = 1
    @IBOutlet var youtubePlayerView: YouTubePlayerView!
    
    @IBAction func onFreeDiamonds(_ sender: Any) {
        if let link = URL(string: "http://zuneplay.com/gene2/rules-of-survival.html") {
            UIApplication.shared.open(link)
        }
    }
    @IBOutlet var webView: UIWebView!
    @IBOutlet var freeDiamonds: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        freeDiamonds.layer.cornerRadius = 5
        freeDiamonds.clipsToBounds = true
        
        btnBack.layer.cornerRadius = 5
        btnBack.clipsToBounds = true
        
        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=nkc4pMkNXZg")
        youtubePlayerView.loadVideoURL(myVideoURL! as URL)
        var name = "btn1"
        if (index == 2) { name = "btn2" }
        if (index == 3) { name = "btn3" }
        if let path = Bundle.main.path(forResource: name, ofType: "html", inDirectory: "www") {
            webView.loadRequest(URLRequest(url: URL(fileURLWithPath: path)))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

