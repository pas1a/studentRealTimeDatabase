//
//  ViewController.swift
//  studentRealTimeDatabase
//
//  Created by JOHN GARIEPY on 1/30/25.
//

import UIKit
import FirebaseCore
import FirebaseDatabase




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    var ref: DatabaseReference!
    var names = [String]()
    // var ref: DatabaseReference!

    
    @IBOutlet weak var outlet: UITextField!

    @IBOutlet weak var tableView1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView1.dataSource = self
               tableView1.delegate = self
        
        ref = Database.database().reference()
        
        readFromFirebase()
        
        let student1 = Students(name: "billy", age: 23)
        student1.saveToFireBase()
    }

    @IBAction func buttonInput(_ sender: UIButton) {
        let name = outlet.text!

        names.append(name)
        
        ref.child("students").childByAutoId().setValue(name)
        
        outlet.text = ""
        tableView1.reloadData()
        
    }
    
    func readFromFirebase(){
        ref.child("students").observe(.childAdded, with: { (snapshot) in
                   // snapshot is a dictionary with a key and a value
                    
                    // this gets each name from each snapshot
                    let n = snapshot.value as! String
                    // adds the name to an array if the name is not already there
                    if !self.names.contains(n){
                        self.names.append(n)
                        print(n)
                    }
                })
        
        //called after .childAdded is done
                ref.child("students").observeSingleEvent(of: .value, with: { snapshot in
                        print("--inital load has completed and the last user was read--")
                    print(self.names)
                    self.tableView1.reloadData()
                    })
        
        


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "myCell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
    
}

