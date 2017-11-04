//
//  Main.swift
//  craftaxethrowing
//
//  Created by Travis Cornelius on 10/18/17.
//  Copyright © 2017 Travis Cornelius. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileController: UIViewController {
    var ref: DatabaseReference!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let alertController = UIAlertController(title: "Error", message: "Auth.auth().currentUser?.displayName", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func updateProfile
        (_ sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = "jake Jensen"
            changeRequest?.commitChanges() { (error) in
                
            }
            
            Auth.auth().currentUser?.updateEmail(to: email.text!) { (error) in
                
            }
            let alertController = UIAlertController(title: "Error", message: Auth.auth().currentUser?.displayName, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
        }
        
    }
    
}


