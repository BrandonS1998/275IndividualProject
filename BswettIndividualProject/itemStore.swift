//
//  itemStore.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/9/20.
//

import UIKit

class itemStore{
    var allItems = [Item]()
    
    let itemArchiveURL : URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init() {
        do{
            let data = try Data(contentsOf: itemArchiveURL)
            if let archievedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item]{
                allItems = archievedData
            }
        }catch {
            allItems = []
        }
//        for _ in 0...2{
//            createEntry()
//        }
    }
    
    @discardableResult func createEntry() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func deleteEntry(_ item : Item){
        // Checking if item is in allItems
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveEntry(from FromIndex : Int, to toIndex : Int){
        if FromIndex == toIndex{
            return
        }
        
        let movedItem = allItems[FromIndex]
        
        allItems.remove(at: FromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        print("Items being saved to : \(itemArchiveURL.path)")
        
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
}
