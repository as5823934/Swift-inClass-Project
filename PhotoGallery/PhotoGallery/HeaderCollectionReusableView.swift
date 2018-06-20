//
//  HeaderCollectionReusableView.swift
//  PhotoGallery
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var category: PhotoCategory! {
        didSet {
            categoryLabel.text = category.title
            categoryImageView.image = UIImage(named: category.CategoryImageName)
        }
    }
    
}
