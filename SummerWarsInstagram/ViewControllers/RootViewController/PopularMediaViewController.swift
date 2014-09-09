//
//  PopularMediaViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 8/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class PopularMediaViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "IdentifierMediaImageViewCell")
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "IdentifierMediaLabelCell")
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let row = indexPath.row
        
        if row == 0 {
            return 320
        } else {
            return 50
        }
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let row = indexPath.row

        if row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("IdentifierMediaImageViewCell", forIndexPath: indexPath) as UITableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("IdentifierMediaLabelCell", forIndexPath: indexPath) as UITableViewCell
            
            return cell
        }
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
//        
//        cell.textLabel.text = String(format: "%i", indexPath.row+1)
//        
//        return cell
    }
}
