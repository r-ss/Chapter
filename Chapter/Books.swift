//
//  Books.swift
//  chapter
//
//  Created by Alex Antipov on 04/10/15.
//  Copyright © 2015 Alex Antipov. All rights reserved.
//

import UIKit

class Books {
    
    var books = [Book]()
    
    var booksCount:Int {
        return self.books.count
    }
    
    func addBook(newBook:Book) {
        self.books.append(newBook)
        //saveStocks()
    }
    
    func updateBook(newBook:Book, atIndex i:Int) {
        self.books[i] = newBook
        //saveStocks()
    }
    
    func removeBookAtIndex(index:Int) {
        self.books.removeAtIndex(index)
        //saveStocks()
    }
    
    func loadSampleBooks(){
        let book1 = Book(author: "Эрих Мария Ремарк", title: "Триумфальная арка", date: NSDate())
        let book2 = Book(author: "Габриэль Гарсиа Маркес", title: "Десять дней в море без еды и воды", date: NSDate())
        let book3 = Book(author: "Артур Кларк", title: "Свидание с Рамой", date: NSDate())
        let book4 = Book(author: "Харуки Мураками", title: "Кафка на пляже", date: NSDate())
        let book5 = Book(author: "Энди Вейр", title: "Марсианин", date: NSDate())
        let book6 = Book(author: "Дэниел Ергин", title: "Добыча", date: NSDate())
        let book7 = Book(author: "Владимир Савенюк", title: "Инвестировать - это просто!", date: NSDate())
        let book8 = Book(author: "0", title: "Rework бизнес без предрассудков", date: NSDate())
        
        self.books += [book1, book2, book3, book4, book5, book6, book7, book8]
    }
    
}
