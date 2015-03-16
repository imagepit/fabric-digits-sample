//
//  ViewController.swift
//  sms-sample
//
//  Created by 高橋良輔 on 2015/03/16.
//  Copyright (c) 2015年 高橋良輔. All rights reserved.
//

import UIKit
import TwitterKit
import Fabric

class ViewController: UIViewController {
    
    @IBOutlet var userIdLabel:UILabel? = UILabel()
    @IBOutlet var telLabel:UILabel? = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        Digits.sharedInstance().logOut()
        // Do any additional setup after loading the view, typically from a nib.
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
            (session: DGTSession!, error: NSError!) in
            // play with Digits session
            if (error != nil) {
                println("Error:\(error)")
            } else {
                println("UserId:\(session.userID), PhoneNumber:\(session.phoneNumber)")
                self.userIdLabel!.text = session.userID
                self.telLabel!.text = session.phoneNumber
            }
        })
        authenticateButton.center = self.view.center
        self.view.addSubview(authenticateButton)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

