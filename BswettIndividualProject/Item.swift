//
//  Item.swift
//  BswettIndividualProject
//
//  Created by Brandon Swett on 11/9/20.
//

import UIKit

class Item : NSObject {
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
            let titles = ["Permanent Record","Game of Thrones","Test"]
        // Getting index for our random book entry, we only need one as the index of each array match up.
            let index = arc4random_uniform(UInt32(titles.count))
            let authors = ["Edward Snowden","George RR Martin","Test"]
            let pageCounts = [352,694,1]
            let complete = ["Y","Y","Test"]
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
    
    
}
