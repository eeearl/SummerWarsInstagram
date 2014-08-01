//
//  RootViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 7/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

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
