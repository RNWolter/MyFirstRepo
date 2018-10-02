//
//  ItemDetailViewController.swift
//  CollectionWeek1
//
//  Created by Rick Wolter on 10/1/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var itemController: ItemController?
   var item: Item?
    //{
//        didSet {
//            updateViews()
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

   
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = itemTextField.text, let value = valueTextField.text, let location = locationTextField.text else {return}
       
        if let item = item {
            itemController?.updateItem(itemToUpdate: item, name: name, value: value, location: location  )
        } else {
            
            let _ = itemController?.createNewItem(name: name , value: value, location: location)
       
        }
        
        //var item = Item(name: name,value: value,location: location)
       navigationController?.popViewController(animated: true)
    }
    
    private func updateViews(){
        guard let item = item else {
            title = "New Item"
            return
        }
        title = item.name
        itemTextField.text = item.name
        valueTextField.text = item.value
        locationTextField.text = item.location
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var itemTextField: UITextField!
     @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
   
}
