//
//  PhotoViewCell.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 5/2/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bind(photo : Photo) {
        let url = URL(string: photo.urls!.small!)
        image.kf.setImage(with: url)
    }
}
