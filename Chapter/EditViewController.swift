//
//  EditViewController.swift
//  chapter
//
//  Created by Alex Antipov on 04/10/15.
//  Copyright © 2015 Alex Antipov. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var book: Book?
    var editMode:Bool = false // Are we editing or adding new Book
    
    let labelTitle = UILabel()
    let textFieldTitle = UITextField()
    
    let labelAuthor = UILabel()
    let textFieldAuthor = UITextField()
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    struct Data {
        var title:String = ""
        var author:String = ""
        var date:NSDate = NSDate()
    }
    var data = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.target = self
        cancelButton.action = "cancelPressed"
        saveButton.target = self
        saveButton.action = "savePressed"
        saveButton.enabled = false
        
        generateInputViews()
        
        if let book = book {
            //navigationItem.title = book.formattedTitle
            
            textFieldTitle.text = book.title
            textFieldAuthor.text = book.author
            
            //textFieldValue.text = textFieldValue.text!.stringByReplacingOccurrencesOfString(".", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
            //textFieldPercent.text = textFieldPercent.text!.stringByReplacingOccurrencesOfString(".", withString: ",", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            //textFieldValue.text = formatter.stringFromNumber(stock.value)
            //textFieldPercent.text = formatter.stringFromNumber(stock.percent * 100)
            editMode = true
        } else {
            //print(selectedType)
            //textFieldName.text = selectedType.title
            //segmentedControlCurrency.selectedSegmentIndex = defaultCurrency.id
            //navigationItem.title = selectedType.title
        }
        
        
        validateInputFields()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.textFieldTitle.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.textFieldTitle.resignFirstResponder()
        self.textFieldAuthor.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelPressed() {
        print("> cancelPressed")

        self.performSegueWithIdentifier("unwindToBooksList", sender: self.cancelButton)
    }
    
    func savePressed() {
        print("> savePressed")
        
        self.performSegueWithIdentifier("unwindToBooksList", sender: self.saveButton)
    }
    

    func generateInputViews(){
        
        let viewSize = self.view.frame.size
        let screenWidth = viewSize.width
        
        let labelMargin:CGFloat = 20.0
        let fieldMargin:CGFloat = 13.0
        let smallMargin:CGFloat = 2.0
        let bigMargin:CGFloat = smallMargin * 2
        let fieldHeight:CGFloat = 40.0
        let labelHeight:CGFloat = 18.0
        
        let longFieldWidth = screenWidth - fieldMargin * 2
        let labelWidth = screenWidth - labelMargin * 2
        
        var topMarginSummary:CGFloat = 80
        
        //
        // Title
        //
        labelTitle.frame = CGRect(x: labelMargin, y: topMarginSummary, width: labelWidth, height: labelHeight)
        styleLabel(labelTitle)
        labelTitle.text = "Title"
        self.view.addSubview(labelTitle)
        topMarginSummary += labelHeight + smallMargin
        
        textFieldTitle.frame = CGRect(x: fieldMargin, y: topMarginSummary, width: longFieldWidth, height: fieldHeight)
        styleTextField(textFieldTitle)
        textFieldTitle.text = ""
        textFieldTitle.keyboardType = UIKeyboardType.ASCIICapable
        self.view.addSubview(textFieldTitle)
        topMarginSummary += fieldHeight + bigMargin
        
        //
        // Author
        //
        labelAuthor.frame = CGRect(x: labelMargin, y: topMarginSummary, width: labelWidth, height: labelHeight)
        styleLabel(labelAuthor)
        labelAuthor.text = "Author"
        self.view.addSubview(labelAuthor)
        topMarginSummary += labelHeight + smallMargin
        
        textFieldAuthor.frame = CGRect(x: fieldMargin, y: topMarginSummary, width: longFieldWidth, height: fieldHeight)
        styleTextField(textFieldAuthor)
        textFieldAuthor.text = ""
        textFieldAuthor.keyboardType = UIKeyboardType.ASCIICapable
        self.view.addSubview(textFieldAuthor)
        topMarginSummary += fieldHeight + bigMargin

        
        
        //textFieldTitle.delegate = self
        //textFieldAuthor.delegate = self
        //textFieldPercent.delegate = self
        
        
        
        textFieldTitle.addTarget(self, action: Selector("validationEventTick:"), forControlEvents: UIControlEvents.EditingChanged)
        textFieldAuthor.addTarget(self, action: Selector("validationEventTick:"), forControlEvents: UIControlEvents.EditingChanged)


        
    }
    
    func styleLabel(label:UILabel) {
        label.font = UIFont.systemFontOfSize(12, weight: UIFontWeightRegular)
        label.textColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1.0)
        styleView(label)
    }
    
    func styleTextField(field:UITextField) {
        field.borderStyle = UITextBorderStyle.RoundedRect
        field.font = UIFont.systemFontOfSize(18, weight: UIFontWeightLight)
        styleView(field)
    }
    
    func styleView(view:UIView){
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func validationEventTick(sender:UITextField){
        validateInputFields()
    }
    
    func validateInputFields() {
        print("> validateInputFields")
        let whitespaceSet = NSCharacterSet.whitespaceCharacterSet()
        var valid = false
        
        
        
        var validTitle = false
        if let title:String = textFieldTitle.text {
            if !title.isEmpty {
                if title.stringByTrimmingCharactersInSet(whitespaceSet) != "" {
                    validTitle = true
                }
            }
        }
        
        var validAuthor = false
        if let author:String = textFieldAuthor.text {
            if !author.isEmpty {
                if author.stringByTrimmingCharactersInSet(whitespaceSet) != "" {
                    validAuthor = true
                }
            }
        }
    
        
        
        if (validTitle && validAuthor){
            valid = true
        }
        
        


        
        if valid {
            data.title = textFieldTitle.text!
            data.author = textFieldAuthor.text!
            data.date = NSDate()
        }
        
        
        saveButton.enabled = valid
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if cancelButton === sender {
            print("> CANCEL PRESSED xxx")
        }
        
        if saveButton === sender {
            print("> SAVE PRESSED")
            //stock = Stock(type: self.selectedType, name: data.name , value: data.value, currency: data.currency, percent: data.percent, note: data.note)
            book = Book(author: data.author, title: data.title, date: data.date)
        }
    }

}
