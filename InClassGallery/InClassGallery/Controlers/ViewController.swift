//
//  ViewController.swift
//  InClassGallery
//
//  Created by ping tseng tsai on 2018-06-01.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

fileprivate var longPressGesture: UILongPressGestureRecognizer!

class ViewController: UIViewController {
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var cityDataSource = CityDataSource()
    var myDataSource = ["🎃", "🤖", "💩", "👺", "🦉", "👻", "🐶", "🐴", "🐟", "😸"]
    
    private var category = 0 {
        didSet{
            collectionView.reloadData()
        }
    }
    
    @IBAction func selectedCategory(_ sender: UISegmentedControl) {
        category = sender.selectedSegmentIndex
    }
    
    @IBAction func deleteSelected(_ sender: Any) {
        if let selected = collectionView.indexPathsForSelectedItems {
            let layout = collectionView.collectionViewLayout as! FlowLayout
            layout.deletedItem = selected
            cityDataSource.deleteItemsAtIndexPaths(selected, category)
            
            let items = selected.map {$0.item}.sorted().reversed()
            for item in items {
                myDataSource.remove(at: item)
            }
            collectionView.deleteItems(at: selected)
            navigationController?.isToolbarHidden = true
        }
    }
    
    @IBAction func addItem() {
        
        let city = City(id: 0, name: "North Vancouver", province: "British Columbia")
        if let index = cityDataSource.provinces.index(of: city.province) {
            var pos = 0
            for i in 0...index {
                pos += cityDataSource.numberOfCitiesInSection(i, category)
            }
            cityDataSource.cities.insert(city, at: pos)
            // 1. where to add (index)
            let index = IndexPath(item: cityDataSource.numberOfCitiesInSection(index, category) - 1, section: index)
            let layout = collectionView.collectionViewLayout as! FlowLayout
            layout.addedItem = index
            
            // 2. tell the collectionView to insert into the view
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.0, options: [], animations: {
                self.collectionView.insertItems(at: [index])
            }) { (finished) in
                layout.addedItem = index
            }
        } else {
            
        }
    }
    
    //MARK: ResfreshControll
    @objc func refresh() {
        addItem()
        //finish refresh control
        collectionView.refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        //tell collectionView to use the refresh control
        collectionView.refreshControl = refresh
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let width = (view.frame.size.width) / 3
       
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionView?.addGestureRecognizer(longPressGesture)
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.isToolbarHidden = true
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        addButton.isEnabled = !editing
        deleteButton.isEnabled = editing
        collectionView.allowsMultipleSelection = editing
        
        let indexPaths = collectionView.indexPathsForVisibleItems
        for index in indexPaths {
            let cell = collectionView.cellForItem(at: index) as! MyCollectionViewCell
            cell.isEditing = editing
        }
        
        if !editing {
            navigationController?.isToolbarHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let detailVC = segue.destination as? DetailViewController {
                if let index = sender as? IndexPath {
                    detailVC.selectedCity = cityDataSource.cellForItemAt(index, category)
                }
            }
        }
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
}


//MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cityDataSource.numberOfSections(category)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityDataSource.numberOfCitiesInSection(section, category)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        let city = cityDataSource.cellForItemAt(indexPath, category)
        cell.emojiLabel.text = city.name
        cell.isEditing = isEditing
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(sender:)))
        cell.addGestureRecognizer(pinch)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderView
        header.title = cityDataSource.headerTitle(indexPath, category)
        
        return header
    }
    
    //MARK: PinchGesture
    @objc func pinch(sender:UIPinchGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        case .ended:
            sender.view?.transform = CGAffineTransform.identity
            sender.scale = 1
        default:
            break
        }
    }
}

//MARK: UIConllectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !isEditing {
            performSegue(withIdentifier: "detail", sender: indexPath)
        }  else {
            navigationController?.isToolbarHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         if isEditing {
            if let selected = collectionView.indexPathsForSelectedItems {
                if selected.count == 0 {
                    navigationController?.isToolbarHidden = true
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let mydata = cityDataSource.cities[sourceIndexPath.item]
        cityDataSource.cities[sourceIndexPath.item] = cityDataSource.cities[destinationIndexPath.item]
        cityDataSource.cities[destinationIndexPath.item] = mydata
    }
}
