//
//  RootViewController.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 7/26/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit
import Foundation

class RootViewController: UIViewController, UICollectionViewDataSource {
    
    var mediaArray = [AnyObject]()    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.collectionView.registerClass(PopularMediaCollectionViewCell.self, forCellWithReuseIdentifier: "PopularMediaCollectionViewCell")
        
        self.loadDefaultMedia()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDefaultMedia() {
        if let accessToken = InstagramEngine.sharedManager()?.accessToken? {
            
        } else {
            self.loadPopularMedia()
        }
    }
    
    func loadPopularMedia() {
        let successBlock: ([AnyObject]!, InstagramPaginationInfo!) -> Void = { media, paginationInfo in
            self.mediaArray.removeAll(keepCapacity: false)
            for object in media {
                if let instagramMedia = object as? InstagramMedia {
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
        self.collectionView.reloadData()
    }

    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return self.mediaArray.count;
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var popularMediaCollectionViewCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("PopularMediaCollectionViewCell", forIndexPath: indexPath) as PopularMediaCollectionViewCell
        
        let instagramMedia:InstagramMedia = self.mediaArray[indexPath.row] as InstagramMedia
        var popularImage =  UIImage(data: NSData(contentsOfURL: instagramMedia.thumbnailURL))
        
        if let popularImageView = popularMediaCollectionViewCell.popularMediaImageView {
            // !!! 현재 여기서 이미지뷰를 가져오지 못해서 이미지를 보여주지 못하고 있다. 
            popularImageView.image = popularImage
        }
        
        return popularMediaCollectionViewCell;
    }
}
