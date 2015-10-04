//
//  Book.swift
//  chapter
//
//  Created by Alex Antipov on 04/10/15.
//  Copyright © 2015 Alex Antipov. All rights reserved.
//

//import Foundation
import UIKit

class Book {
    
    var author:String?
    var title:String?
    var date:NSDate?
    
    var formattedTitle:String {
        if let ttl = self.title {
            //return "«\(ttl)»"
            return ttl
        } else {
            return ""
        }
    }
    
    init(author:String, title:String, date:NSDate){
        self.author = author
        self.title = title
        self.date = date
    }
    
}