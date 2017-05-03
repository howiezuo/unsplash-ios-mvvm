//
//  ListFlowLayout.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 5/2/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import UIKit

class ListFlowLayout: UICollectionViewFlowLayout {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup();
    }
    
    func setup() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return collectionView!.frame.width
    }
    
    func itemHeight() -> CGFloat {
        return floor(collectionView!.frame.width / 1.6)
    }

    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemHeight())
        }
        get {
            return CGSize(width: itemWidth(), height: itemHeight())
        }
    }
}
