//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Meltem Uğurlu on 21.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singInClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
    }
    
    @IBAction func singUpClicked(_ sender: Any) {
    }
}

