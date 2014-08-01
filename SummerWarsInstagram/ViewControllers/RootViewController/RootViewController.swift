//
//  RootViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 7/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var mediaArray = [NSArray]()
    
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
        // typedef void (^InstagramFailureBlock)(NSError *error);
        func instagramFailureBlock(error:NSError) -> Void {
            println("Load Popular Media Failed")
        }
        
        // typedef void(^InstagramMediaBlock)(NSArray *media, InstagramPaginationInfo *paginationInfo);
        func instagramMediaBlock(media:NSArray, paginationInfo:InstagramPaginationInfo) -> Void {
            mediaArray.removeAll(keepCapacity:false)
            mediaArray += media
            reloadData()
        }
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
