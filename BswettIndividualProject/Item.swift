//
//  Item.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/9/20.
//

import UIKit

class Item : NSObject, NSCoding {
    var title : String
    var author : String
    var pageLength : Int
    var complete : String?
    let entryDate : Date


    init(title : String, author :String, pageLength : Int, complete : String?){
        self.title = title
        self.author = author
        self.pageLength = pageLength
        self.complete = complete
        self.entryDate = Date()
    
        super.init()
    }
    
    // Convenience initilizer
    // Randomly create a row from the books I have in my possession.
    convenience init(random: Bool = false){
        // Random parameter is mainly for testing purposes
        if random{
            let titles = ["New Entry"]
        // Getting index for our random book entry, we only need one as the index of each array match up.
            let index = arc4random_uniform(UInt32(titles.count))
            let authors = ["Author"]
            let pageCounts = [0]
            let complete = ["N"]
        // Getting return values
            let randomTitle = titles[Int(index)]
            let randomAuthor = authors[Int(index)]
            let randomPageCount = pageCounts[Int(index)]
            let didRead = complete[Int(index)]
            self.init(title: randomTitle, author: randomAuthor, pageLength: randomPageCount, complete : didRead)

        }
        else{
            self.init(title: "TEST", author: "TEST", pageLength: 0, complete : nil)
        }
    }
    
    func encode(with coder: NSCoder) {
        // Archiving members of the item class.
        coder.encode(title, forKey: "title")
        coder.encode(author, forKey: "author")
        coder.encode(pageLength, forKey: "pageLength")
        coder.encode(complete, forKey: "complete")
        
        coder.encode(entryDate, forKey: "entryDate")
    }
    
    required init (coder acoder: NSCoder) {
        author = acoder.decodeObject(forKey: "author") as! String
        title = acoder.decodeObject(forKey: "title") as! String
        pageLength = acoder.decodeInteger(forKey: "pageLength")
        complete = acoder.decodeObject(forKey: "complete") as! String?

        entryDate = acoder.decodeObject(forKey: "entryDate") as! Date
        
        super.init()
    }
    
}
