//
//  HeaderView.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-04.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class HeaderView: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
