//
//  ListTableViewController.swift
//  chapter
//
//  Created by Alex Antipov on 03/10/15.
//  Copyright © 2015 Alex Antipov. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    @IBOutlet var tableBooks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = Palette.Medium.color

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appDelegate.books.booksCount
        //return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! ListTableViewCell

        
        let cellIdentifier = "ListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ListTableViewCell

        
        // Configure the cell...
        let book:Book = appDelegate.books.books[indexPath.row]
        
        
        cell.titleLabel.textColor = Palette.Lightest.color
        cell.authorLabel.textColor = Palette.Lightest.color
        cell.timeshiftLabel.textColor = Palette.Light.color
        
        cell.backgroundColor = Palette.Medium.color
        
        cell.titleLabel.text = book.formattedTitle
        cell.authorLabel.text = book.author
        
        //print("oo \(book.date!.timeAgoSimple)")
        
        //cell.timeshiftLabel.text = book.date!.timeAgoSimple

        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            appDelegate.books.removeBookAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        updateList()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateList(){
        print("updateList")
        self.tableBooks.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("> prepareForSegue. Segue identifier: \(segue.identifier)")
        
        if segue.identifier == "ShowDetail" {
            //print("OK")
            let bookViewController = segue.destinationViewController as! EditViewController
            // Get the cell that generated this segue.
            if let selectedBookCell = sender as? ListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBookCell)!
                
                let selectedBook = appDelegate.books.books[indexPath.row]
                
                //appDelegate.container.setSelectedStockIndex(indexPath.row)
                
                bookViewController.book = selectedBook
                //stockDetailViewController.selectedStock = selectedStock.type
            }
        }
        //else if segue.identifier == "AddItem" {
            //print("Adding new stock.", terminator: "")
        //}
    }
    
    
    @IBAction func unwindToBooksList(sender: UIStoryboardSegue) {
        print("> ListTableViewController > unwindToBooksList")
        
        if let sourceViewController = sender.sourceViewController as? EditViewController, book = sourceViewController.book {
            print("> ===== ")
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                print("AA")
                // Update an existing stock.
                appDelegate.books.updateBook(book, atIndex: selectedIndexPath.row)
                print(appDelegate.books.books)
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                print("BB")
                // Add a new stock.
                let newIndexPath = NSIndexPath(forRow: appDelegate.books.booksCount, inSection: 0)
                appDelegate.books.addBook(book)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            updateList()
        }
        
    }

}
