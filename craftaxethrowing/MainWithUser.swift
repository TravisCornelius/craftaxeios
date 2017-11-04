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

class MainWithNameController: UIViewController {
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var join: UIButton!
    @IBOutlet weak var roomID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func joinRoom(_ sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            let name = Auth.auth().currentUser?.email
            let data = roomID.text! + "/user"
            self.ref.child(data).setValue(name)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Choose")
            self.present(vc!, animated: true, completion: nil)
        } else {
            
        }
        
    }
    
}

