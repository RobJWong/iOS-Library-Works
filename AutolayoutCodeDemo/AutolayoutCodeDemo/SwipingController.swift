//
//  SwipingController.swift
//  AutolayoutCodeDemo
//
//  Created by Robert Wong on 7/16/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import Foundation
import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//    let headerStrings = ["Join us today in our fun and games!" , "Subscribe and get coupons on our daily events today!", "VIP special services"]
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Body Are you ready for loads and loads of fun?"),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events today!", bodyText: "To get notified of these savings go to our website"),
        Page(imageName: "leaf_third", headerText: "VIP special services", bodyText: "Potato")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "CellID")
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! PageCell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
//        let imageName = imageNames[indexPath.item]
//        cell.bearImageView.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        let page = pages[indexPath.item]
        cell.page = page
        
//        cell.bearImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
