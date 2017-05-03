//
//  ViewController.swift
//  unsplash-ios-mvvm
//
//  Created by Howie Zuo on 4/30/17.
//  Copyright © 2017 Howie. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var photoCollection: UICollectionView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _ = APIClient.getPhotos()
            .subscribe(onNext: { (photos) in
                self.photos = photos
                self.photoCollection.reloadData()
            }, onError: { (error) in
                return
                //
            }, onCompleted: {
                //
            }) {
                //
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoViewCell;
        cell.bind(photo: photos[indexPath.row])
        return cell
    }

}

