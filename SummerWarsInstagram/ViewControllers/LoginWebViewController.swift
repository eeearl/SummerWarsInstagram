//
//  LoginWebViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 9/16/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class LoginWebViewController: UIViewController, UIWebViewDelegate {
    
    var scope: IKLoginScope
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration:Dictionary = InstagramEngine.sharedEngineConfiguration()
        let scopeString:NSString = InstagramEngine.stringForScope(self.scope)
        let urlString = "\(configuration[kInstagramKitAuthorizationUrlConfigurationKey])?client_id=\(configuration[kInstagramKitAppClientIdConfigurationKey])&redirect_uri=\(configuration[kInstagramKitAppClientIdConfigurationKey])&response_type=token&scope=\(scopeString)"
        let url = NSURL.URLWithString(urlString)
    
        self.webView.loadRequest(NSURLRequest(URL: url))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
