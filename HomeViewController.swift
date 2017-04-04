//
//  HomeViewController.swift
//  StyleMee
//
//  Created by Kevin Loyola on 3/30/17.
//  Copyright © 2017 Kevin Loyola. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBAction func uploadButtonPressed(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "UploadSegue", sender: self)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

