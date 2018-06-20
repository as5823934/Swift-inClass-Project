//
//  PhotosCollectionViewController.swift
//  PhotoGallery
//
//  Created by ping tseng tsai on 2018-05-30.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
fileprivate var longPressGesture: UILongPressGestureRecognizer!
var photoCategories = PhotoCategory.fetch()

class PhotosCollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let headerView = "HeaderView"
        static let showDetailSegue = "ShowDetail"
        static let leftAndRightPadding: CGFloat = 2.0
        static var numberOfItemsPerRow: CGFloat = 3.0
    }
    
    @IBAction func SubjectBtn(_ sender: Any) {
        Storyboard.numberOfItemsPerRow = 3.0
        //var temp = PhotosLibrary.downloadPhotosData()
        self.collectionView?.reloadData()
        collectionView?.setNeedsLayout()
        collectionView?.layoutIfNeeded()
    }
    
    @IBAction func LocationBtn(_ sender: Any) {
        Storyboard.numberOfItemsPerRow = 1.0
        collectionView?.reloadData()
        collectionView?.setNeedsLayout()
        collectionView?.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPadding) / Storyboard.numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionView?.addGestureRecognizer(longPressGesture)
    }
    
   
    
    //MARK: - HandleGesture
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
            
        case .began:
            guard let selectedIndexPath = collectionView?.indexPathForItem(at: gesture.location(in: view)) else {
                break
            }
            collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView?.endInteractiveMovement()
        default:
            collectionView?.cancelInteractiveMovement()
        }
    }
    
     // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoCollectionViewCell
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        cell.delegate = self
        
        cell.isUserInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(sender:)))
        cell.addGestureRecognizer(pinch)
        
        return cell
    }
    //MARK: PinchGesture
    @objc func pinch(sender:UIPinchGestureRecognizer) {
        print("here")
        switch sender.state {
        case .began, .changed:
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        case .ended:
            sender.view?.transform = CGAffineTransform.identity
        default:
            break
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.headerView, for: indexPath) as! HeaderCollectionReusableView
        let category = photoCategories[indexPath.section]
        headerView.category = category
        
        return headerView
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let category = photoCategories[indexPath.section]
        let image = UIImage(named: category.imageNames[indexPath.item])
        
        self.performSegue(withIdentifier: Storyboard.showDetailSegue, sender: image)
    }
    
    //MARK: - Delete Items
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if let indexPaths = collectionView?.indexPathsForVisibleItems {
            for indexPath in indexPaths {
                if let cell = collectionView?.cellForItem(at: indexPath) as? PhotoCollectionViewCell {
                    cell.isEditing = editing
                }
            }
        }
    }
    
    //MARK: - Drag and Drop
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("Starting Index: \(sourceIndexPath.item)")
        print("Ending Index: \(destinationIndexPath.item)")
        
        let photoCategory = photoCategories[sourceIndexPath.section]
        var imageNames = photoCategory.imageNames
        
        let firstImageName = imageNames[sourceIndexPath.item]
        imageNames[sourceIndexPath.item] = imageNames[destinationIndexPath.item]
        imageNames[destinationIndexPath.item] = firstImageName
        
        //self.collectionView?.reloadData()
        
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == Storyboard.showDetailSegue {
            let detailVC = segue.destination as! DetailViewController
            detailVC.image = sender as! UIImage
        }
    }
}

extension PhotosCollectionViewController: PhotosCollectionViewCellDelegate {
    func delete(cell: PhotoCollectionViewCell) {
        if let indexPath = collectionView?.indexPath(for: cell) {
            photoCategories[indexPath.section].imageNames.remove(at: indexPath.item)
            collectionView?.deleteItems(at: [indexPath])
        }
    }
}

