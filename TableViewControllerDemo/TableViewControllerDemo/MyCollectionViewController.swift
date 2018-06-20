//
//  MyCollectionViewController.swift
//  TableViewControllerDemo
//
//  Created by ping tseng tsai on 2018-05-28.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CardCell"

class MyCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
    }



    // MARK: UICollectionViewDataSource (How many, what to do)

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return MyTableViewController.students.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.nameLabel.text = MyTableViewController.students[indexPath.row]
        cell.positionLabel.text = MyTableViewController.positions[indexPath.row]
        
    
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let detailVC = segue.destination as? DetailViewController {
                // sender: object that causes the segue(UITableViewCell)
                if let cell = sender as? MyCollectionViewCell {
                    if let indexPath = collectionView?.indexPath(for: cell){
                        let selectedCell = indexPath.row
                        detailVC.imageName = "smile"
                        detailVC.nameText = MyTableViewController.students[selectedCell]
                        detailVC.positionText = MyTableViewController.positions[selectedCell]
                    }
                }
            }
        }
    }
}
