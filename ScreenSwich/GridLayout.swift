//
//  GridLayout.swift
//  ScreenSwich
//
//  Created by 王 军 on 14/12/8.
//  Copyright (c) 2014年 王 军. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    var numRows:Int!
    var numCols:Int!
    
    override func prepareLayout() {
        super.prepareLayout()
        self.scrollDirection=UICollectionViewScrollDirection.Horizontal
        self.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
        numRows=self.collectionView!.numberOfSections()
        numCols=self.collectionView!.numberOfItemsInSection(0)
    }
    override func collectionViewContentSize() -> CGSize {
        var w:CGFloat=UIScreen.mainScreen().bounds.size.width
        var h:CGFloat=UIScreen.mainScreen().bounds.size.height
        println("--===>>>\(CGSizeMake(CGFloat(numCols)*w, CGFloat(numRows)*h))")
        return CGSizeMake(CGFloat(numCols)*w, CGFloat(numRows)*h)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributesToReturn:[UICollectionViewLayoutAttributes] = super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]

        for  attributes in attributesToReturn {
//            if let elemedKind = attributes.representedElementKind {
                var indexPath: NSIndexPath  = attributes.indexPath;
                attributes.frame = self.layoutAttributesForItemAtIndexPath(indexPath).frame
//            }
        }
        return attributesToReturn;
    }
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        NSLog("*******shouldInvalidateLayoutForBoundsChange********")
        return true;
    }
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var attributes = super.layoutAttributesForItemAtIndexPath(indexPath) as UICollectionViewLayoutAttributes
        var w:CGFloat=UIScreen.mainScreen().bounds.size.width
        var h:CGFloat=UIScreen.mainScreen().bounds.size.height
        attributes.frame = CGRectMake(CGFloat(indexPath.item) * w, CGFloat(indexPath.section) * h, w, h);
        return attributes
    }
}
