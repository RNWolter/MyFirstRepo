//
//  ItemController.swift
//  CollectionWeek1
//
//  Created by Rick Wolter on 10/1/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import Foundation


class ItemController {
    
     var items = [Item]()
    
    
    func createNewItem(name: String, value: String, location: String) -> Item{
        let newItem = Item(name: name,value: value,location: location )
        items.append(newItem)
        return newItem
    }
    
    func updateItem(itemToUpdate: Item, name: String, value: String, location: String)
    {
        
        guard let index = items.index(of: itemToUpdate) else {return}
        let item = Item(name: name, value: value, location: location)
        items[index] = item
        
        
    }
    
    
    
}
