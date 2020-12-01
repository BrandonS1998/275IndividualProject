//
//  ItemsViewController.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/9/20.
//

import UIKit

class ItemsViewController : UITableViewController {
    var itemStore : itemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
        /*
        // Get height of status bar
        let barHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: barHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets*/
    }
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView : UITableView,
                            cellForRowAt indexPath : IndexPath) -> UITableViewCell{
        // Creating a default appearence of UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        as! itemCell
        // Set text on cell with title
        let item = itemStore.allItems[indexPath.row]
        
        let temp = item.pageLength
        let Xtemp = temp as NSNumber
        
        cell.authorLabel.text = item.author
        cell.pageLabel122.text = Xtemp.stringValue
        cell.titleLabel.text = item.title
        let read = item.complete?.lowercased()
        if read == "y"{
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
    @IBAction func addNewBook(_ sender: UIBarButtonItem){
        // Create new item
        let newItem = itemStore.createEntry()
        // Decide where that item is in array
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)

        }
        
        //tableView.insertRows(at: [indexPath], with: .automatic)
    }
  
    override func tableView(_ tableView : UITableView, commit editingStyle : UITableViewCell.EditingStyle, forRowAt indexPath : IndexPath){
        
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete\(item.title)?"
            let message = "Would you like to delete this entry?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                
                self.itemStore.deleteEntry(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,           to destinationIndexPath: IndexPath) {
        return
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check to see if segue is the one we want
        
        switch segue.identifier {
        case "detailView":
            // What row was tapped
            if let row = tableView.indexPathForSelectedRow?.row{
                // Get item associated with this row
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {

    }
}
