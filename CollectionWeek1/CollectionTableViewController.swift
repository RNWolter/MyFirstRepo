//
//  CollectionTableViewController.swift
//  CollectionWeek1
//
//  Created by Rick Wolter on 10/1/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController {

    
    
    var itemController = ItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        itemController.items.remove(at: indexPath.row)
        
      
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemController.items.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = itemController.items[indexPath.row]
        cell.textLabel?.text = item.name
       

        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destinationVC = segue.destination as? ItemDetailViewController else {return}
        
        if segue.identifier == "DetailSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC.item = itemController.items[indexPath.row]
            destinationVC.itemController = itemController
        } else if segue.identifier == "AddSegue" {
            destinationVC.itemController = itemController
        }
     
    }
}
