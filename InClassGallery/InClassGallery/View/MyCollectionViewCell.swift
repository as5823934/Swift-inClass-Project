//
//  MyCollectionViewCell.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-01.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var checkBox: UIImageView!
    
    
//    var model {
//        didSet {
//            mainImage.image = UIImage(named: <#T##String#>)
//        }
//    }
    
    var isEditing: Bool = false {
        didSet {
            checkBox.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                checkBox.image = isSelected ? #imageLiteral(resourceName: "Checked") : #imageLiteral(resourceName: "Unchecked")
            }
        }
    }
}
