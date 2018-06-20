//
//  FlowLayout.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-05.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    var addedItem: IndexPath?
    var deletedItem: [IndexPath]?
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath), let added = addedItem, added == itemIndexPath else { return nil }
        
        attributes.center = CGPoint(x: collectionView!.frame.width, y: 0)
        attributes.alpha = 1.0
        attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attributes.zIndex = 50
        return attributes
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attuributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath), let deleted = deletedItem, deleted.contains(itemIndexPath) else {
            return nil
        }
        attuributes.alpha = 1.0
        attuributes.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        attuributes.zIndex = -1
        return attuributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var result = [UICollectionViewLayoutAttributes]()
        if let attributes = super.layoutAttributesForElements(in: rect) {
            for item in attributes {
                let cellAttibutes = item.copy() as! UICollectionViewLayoutAttributes
                if item.representedElementKind == nil {
                    let frame = cellAttibutes.frame
                    cellAttibutes.frame = frame.insetBy(dx: 2.0, dy: 2.0)
                }
                result.append(cellAttibutes)
            }
        }
        
        return result
    }

}
