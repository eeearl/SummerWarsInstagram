//
//  RootViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 7/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit
import Foundation

class RootViewController: UIViewController {
    
    var mediaArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.loadDefaultMedia()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDefaultMedia() {
        if (InstagramEngine.sharedManager()?.accessToken?) {
            
        } else {
            self.loadPopularMedia()
        }
    }
    
    func loadPopularMedia() {
        let successBlock: ([AnyObject]!, InstagramPaginationInfo!) -> Void = { media, paginationInfo in
            
            self.mediaArray.removeAll(keepCapacity: false)
            
            for obj in media {
                if let instagramMedia = obj as? InstagramMedia {
                    println(instagramMedia.thumbnailURL)
                    self.mediaArray.append(instagramMedia)
                }
            }
            
            self.reloadData()
        }
        
        let failureBlock: (NSError!) -> Void = { error in
            println("Load Popular Media Failed")
        }
        
        InstagramEngine.sharedManager().getPopularMediaWithSuccess(successBlock, failure: failureBlock)
    }
    
    func reloadData() {
        println("reloadData");
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
