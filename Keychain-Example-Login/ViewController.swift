//
//  ViewController.swift
//  Keychain-Example-Login
//
//  Created by Rohit on 20/10/16.
//  Copyright © 2016 Introp. All rights reserved.
//

import UIKit
import Locksmith

struct TwitterAccount: ReadableSecureStorable,
    CreateableSecureStorable,
    DeleteableSecureStorable,
GenericPasswordSecureStorable {
    let username: String
    let password: String
    
    let service = "myService" // this might be your bundle identifier (recommend to keep your keychain unique)
    var account: String { return username }
    var data: [String: AnyObject] {
        return ["password": password]
    }
}

struct MyAccount: ReadableSecureStorable{
    let username: String
    let service = "myService" // this might be your bundle identifier (recommend to keep your keychain unique)
    var account: String { return username }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        var username = "Rohit1"
//        var password = "Password1"
//        
//        // store account in keychin
//        let account = TwitterAccount(username: username, password: password)
//        do{
//            try account.createInSecureStore() // saves TwitterAccount to keychain on our device.
//        }catch{
//            
//        }
//        
//        // store username in plist
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        userDefaults.setValue(username, forKey: "twigme_username")
//        userDefaults.synchronize()
        
        // STOP HERE & NEXT TIME START FROM HERE TO SEE WHETHER WE GOT PASSWORD
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let twigmeUsername = userDefaults.valueForKey("twigme_username")
        
        //print(MyAccount(username: twigmeUsername as! String).readFromSecureStore()?.data!["password"])
        
        
        let dictionary = Locksmith.loadDataForUserAccount(twigmeUsername as! String)
        let password = dictionary!["password"]
        print(password)
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

