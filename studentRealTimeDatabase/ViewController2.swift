//
//  ViewController2.swift
//  studentRealTimeDatabase
//
//  Created by JOHN GARIEPY on 2/6/25.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   var ref: DatabaseReference!

   var listOfStudents = [Students]()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var tableView2: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "freakyCell")
        cell?.textLabel?.text = listOfStudents[indexPath.row].name
        cell?.detailTextLabel?.text = String(listOfStudents[indexPath.row].age)
        return cell!
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2.dataSource = self
        tableView2.delegate = self
        ref = Database.database().reference()
        
        let bobbyBoy = Students(name: "billyBob", age: 12)
        
        
        ref.child("students2").observe(.childAdded, with: { (snapshot) in
                   // snapshot is a dictionary with a key and a dictionary as a value
                    // this gets the dictionary from each snapshot
                    let dict = snapshot.value as! [String:Any]
                   
                    // building a Student object from the dictionary
                    let s = Students(dict: dict)
                    // adding the student object to the Student array
                    self.listOfStudents.append(s)
                     self.tableView2.reloadData()
        // should only add the student if the student isn’t already in the array
        // good place to update the tableview also
                    
                })

        
        
        
        
        
    }
      
    
    @IBAction func button2(_ sender: Any) {
        var bob = nameTextField.text!
        var bill = ageTextField.text!
        
        var new = Students(name: bob, age: Int(bill) ?? 0)
        new.saveToFireBase()
        self.tableView2.reloadData()
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
