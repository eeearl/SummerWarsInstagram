//
//  PopularMediaCollectionViewCell.swift
//  SummerWarsInstagram
//
//  Created by HappyEngineer on 8/11/14.
//  Copyright (c) 2014 Happy__Engineer. All rights reserved.
//

import UIKit

class PopularMediaCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var popularMediaImageView: UIImageView!

    override func layoutSubviews() {
        self.backgroundColor = UIColor.greenColor()
    }
    
    class func layoutSize() -> CGSize {
        return CGSizeMake(106.0, 106.0)
    }
}
