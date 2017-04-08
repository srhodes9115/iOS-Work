//
//  signupController.swift
//  HomeBase
//
//  Created by student1 on 3/16/16.
//  Copyright © 2016 villanova. All rights reserved.
//

import UIKit

class signUpController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var teamNameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var checkPasswordInput: UITextField!
    
    var databasePath = NSString()
    
    let typeViewPickerData = ["Baseball","Softball"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        //Identify apps Document directory and constructs path to the database
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirPaths[0]
        databasePath = docsDir.stringByAppendingString("myHomeBase.db")
        
        //check if the databse exists
        if !filemgr.fileExistsAtPath(databasePath as String) {
            let homebaseDB = FMDatabase(path: databasePath as String)
            if homebaseDB == nil {
                print("Error: \(homebaseDB.lastErrorMessage())")
            }
            //opens database and creates table
            if homebaseDB.open() {
                let sql_stmt = "CREATE TABLE 'users' ('id' INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL , 'firstName' TEXT NOT NULL , 'lastName' TEXT NOT NULL , 'email' TEXT NOT NULL  UNIQUE , 'password' TEXT NOT NULL , 'teamName' TEXT NOT NULL , 'username' TEXT NOT NULL UNIQUE )"
                if !homebaseDB.executeStatements(sql_stmt) {
                    print("Error: \(homebaseDB.lastErrorMessage())")
                }
                homebaseDB.close() //close the database
            } else {
                print("Error: \(homebaseDB.lastErrorMessage())")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitSignUp(sender: AnyObject) {
        let userFirstName = firstNameInput.text
        let userLastName = lastNameInput.text
        let userEmail = emailInput.text
        let userTeamName = teamNameInput.text
        let userName = usernameInput.text
        let userPassword = passwordInput.text
        let userCheckPassword = checkPasswordInput.text
        
        if (userFirstName!.isEmpty || userLastName!.isEmpty || userEmail!.isEmpty || userTeamName!.isEmpty || userName!.isEmpty || userPassword!.isEmpty || userCheckPassword!.isEmpty)
        {
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required. Please complete all fields", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return
        }
        
        if (userPassword != userCheckPassword)
        {
            let myAlert = UIAlertController(title: "Alert", message: "Passwords do not match. Please try again", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return
        }
        
        //Insert data to database
        let homebaseDB = FMDatabase(path: databasePath as String)
        
        if homebaseDB.open() {
            let insertSQL = "INSERT INTO users (firstName, lastName, email, password, teamName, username) VALUES ('\(firstNameInput.text)', '\(lastNameInput.text)', '\(emailInput.text)', '\(passwordInput.text)', '\(teamNameInput.text)', '\(usernameInput.text)')"
            let result = homebaseDB.executeUpdate(insertSQL,withArgumentsInArray: nil)
            
            let myAlert = UIAlertController(title: "Alert", message: insertSQL, preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            if !result {
                print("Error: \(homebaseDB.lastErrorMessage())")
            }
        } else {
            print("Error: \(homebaseDB.lastErrorMessage())")
        }
    
    }
    
    //Mandatory functions for UIPickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int { //only 1 for Baseball/softball
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { //number of rows in each component
        return typeViewPickerData.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeViewPickerData[row]
    }
    
    /*
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //action on selection
    }*/
    
    
    
        
}

