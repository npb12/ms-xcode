//
//  SocialWebViewController.swift
//  ms
//
//  Created by Neil Ballard on 6/19/15.
//  Copyright (c) 2015 Missed Social. All rights reserved.
//
import UIKit
import WebKit

class SocialWebViewController: UIViewController {
    
    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string:"http://www.instagram.com/sollcaruso/")
        var req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
