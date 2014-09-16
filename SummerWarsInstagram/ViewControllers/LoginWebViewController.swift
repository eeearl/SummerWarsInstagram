//
//  LoginWebViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 9/16/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class LoginWebViewController: UIViewController, UIWebViewDelegate {
    
    var scope: IKLoginScope = IKLoginScope.Basic
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration:Dictionary = InstagramEngine.sharedEngineConfiguration()
        let scopeString:NSString = InstagramEngine.stringForScope(self.scope)
        
        let urlString = NSString(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@", configuration[kInstagramKitAuthorizationUrlConfigurationKey] as NSString, configuration[kInstagramKitAppClientIdConfigurationKey] as NSString, configuration[kInstagramKitAppRedirectUrlConfigurationKey] as NSString, scopeString)
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
