//
//  LoginController.swift
//  HomeBase
//
//  Created by student1 on 3/17/16.
//  Copyright © 2016 villanova. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitLogin(sender: AnyObject) {
    
        let username = usernameInput.text
        let password = passwordInput.text
        
        if (username!.isEmpty || password!.isEmpty) {
            
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required. Please complete all fields", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
            return

        }
    }
    
}
