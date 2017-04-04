//
//  TableViewController.swift
//  StyleMee
//
//  Created by Kevin Loyola on 3/30/17.
//  Copyright © 2017 Kevin Loyola. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct postStruct {
    let title : String!
    let message : String!
    
    
}



class TableViewController: UITableViewController {
    
    
    var posts = [postStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
            snapshot in
            
            let title = snapshot.value!["title"] as! String
            let message = snapshot.value!["message"] as! String
            
            self.posts.insert(postStruct(title: title ,message: message), atIndex: 0 )
            self.tableView.reloadData()
        
        })
        
        
        post()
    }
    
    func post(){
        
        let title = "Title"
        let message = "Message"
        
        
        let post : [String : AnyObject] = ["title" : title as AnyObject,
                                           "message" : message as AnyObject]
        
      let databaseRef = FIRDatabase.database().reference()
        
      databaseRef.child("Posts").childByAutoId().setValue(post)
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text = posts[indexPath.row].title
        
        
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text = posts[indexPath.row].message
        
        
        
        
        return cell!
        
        
    }
    
    
}
