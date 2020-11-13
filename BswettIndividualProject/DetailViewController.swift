//
//  DetailViewController.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/12/20.
//

import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var dateCreatedField: UILabel!
    @IBOutlet weak var pageCountField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var isReadSwitch: UISwitch!
    
    var item : Item! {
        didSet {
            navigationItem.title = item.title
        }
    }
    
    // Formatter for the date
    let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    let numberFormatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleField.text = item.title
        authorField.text = item.author
        
        let Xtemp = item.pageLength as NSNumber
        pageCountField.text = Xtemp.stringValue
        
        dateCreatedField.text = dateFormatter.string(from: item.entryDate)
        
        if item.complete?.lowercased() == "y"{
            isReadSwitch.setOn(true, animated: true)
        }else{
            isReadSwitch.setOn(false, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Copy changes made
        
        view.endEditing(true)
        
        item.title = titleField.text ?? ""
        if isReadSwitch.isOn{
            item.complete = "y"
        }else{
            item.complete = "n"
        }
        if let valueText = pageCountField.text,
           let value = numberFormatter.number(from: valueText){
            item.pageLength = value.intValue
        }else{
            item.pageLength = 0
        }
        item.author = authorField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
}
}
