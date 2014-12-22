//
//  PictureViewController.swift
//  ScreenSwich
//
//  Created by 王 军 on 14/12/3.
//  Copyright (c) 2014年 王 军. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    var scrollPositionBeforeRotation:CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        var pictureCollectionViewCellNIB = UINib(nibName: "PictureCollectionViewCell", bundle: nil)
        collectionView!.registerNib(pictureCollectionViewCellNIB, forCellWithReuseIdentifier: "PictureCollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        NSLog("屏幕即将旋转")
        
        collectionView!.collectionViewLayout.invalidateLayout()
        scrollPositionBeforeRotation = CGPointMake(collectionView!.contentOffset.x / collectionView!.frame.size.width,
            collectionView!.contentOffset.y / collectionView!.frame.size.height);
        
    }
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            // 上 左 下 右 四个方向的margin
            var newContentOffset:CGPoint  = CGPointMake(self.scrollPositionBeforeRotation!.x * self.collectionView!.frame.size.width,
            self.scrollPositionBeforeRotation!.y * self.collectionView!.frame.size.height);
            self.collectionView!.setContentOffset(newContentOffset, animated: true)
        })
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PictureCollectionViewCell", forIndexPath: indexPath) as PictureCollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
//        NSLog("collectionView-->%@",collectionView.subviews)
        NSLog("数据错误-->%d",indexPath.row)
        cell.initData(indexPath.row)
        return cell
    }
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        var size=UIScreen.mainScreen().bounds.size
        return size
    }

}
