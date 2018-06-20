//
//  MyTableViewController.swift
//  TableViewControllerDemo
//
//  Created by ping tseng tsai on 2018-05-25.
//  Copyright © 2018 ping tseng tsai. All rights reserved.
//

import UIKit
// TableVC
// - DataSource: how many cells, selctions
// - Delegate: each cell what to show?, action?



private var selectedCell: Int = 0

class MyTableViewController: UITableViewController {
    
    static var students = ["Lucas", "Keisuke", "Junpei", "Elif", "Haruka", "Ayako", "Hunter", "Alex", "Jessica", "Cadiz", "Dexun", "Miho", "Ryuma", "Tima", "Eric"]
    
    static var positions = ["Developer", "Developer", "Developer", "Designer", "Developer", "Developer", "Developer", "Developer", "Designer", "Designer", "Developer", "Developer", "Developer", "Designer", "Developer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 140
        
    }
    
    // MARK: UITableViewDataSource
    // how many sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // how may rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyTableViewController.students.count
    }
    
    // what to display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        // configure the cell..
        cell.faceImage.image = #imageLiteral(resourceName: "smile")
        cell.nameLabel.text = MyTableViewController.students[indexPath.row]
        cell.positionLabel.text = MyTableViewController.positions[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // which cell is tapped? -> delegate
        if segue.identifier == "details" {
            if let detailNav = segue.destination as? UINavigationController, let detailVC = detailNav.topViewController as? DetailViewController {
                // sender: object that causes the segue(UITableViewCell)
                if let cell = sender as? MyTableViewCell {
                    if let indexPath = tableView.indexPath(for: cell){
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
