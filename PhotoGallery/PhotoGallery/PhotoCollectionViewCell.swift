//
//  PhotoCollectionViewCell.swift
//  PhotoGallery
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: class {
    func delete(cell: PhotoCollectionViewCell)
}

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView?
    
    @IBOutlet weak var deleteBtnBackgroundView: UIVisualEffectView!
    
    weak var delegate: PhotosCollectionViewCellDelegate?
    
    var imageName: String! {
        didSet {
            photoImageView?.image = UIImage(named: imageName)
            
            deleteBtnBackgroundView.layer.cornerRadius = deleteBtnBackgroundView.bounds.width / 2
            deleteBtnBackgroundView.layer.masksToBounds = true
            deleteBtnBackgroundView.isHidden = !isEditing
            
        }
    }
    
    var isEditing: Bool = false {
        didSet{
            deleteBtnBackgroundView.isHidden = !isEditing
        }
    }
       
    @IBAction func deleteBtnTap(_ sender: Any) {
        delegate?.delete(cell: self)
    }
    
}
