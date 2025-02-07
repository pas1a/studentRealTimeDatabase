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
    
   var listOfStudents = [Students]()
    
    
    @IBOutlet weak var tableView2: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "freakyCell")
        cell?.textLabel?.text = listOfStudents[indexPath.row]
        return cell!
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2.dataSource = self
               tableView2.delegate = self
        

        
        func readFromFirebase(){
         
            
//            ref.child("students").observe(.childAdded, with: { (snapshot) in
//                       // snapshot is a dictionary with a key and a value
//                        
//                        // this gets each name from each snapshot
//                        let n = snapshot.value as! String
//                        // adds the name to an array if the name is not already there
//                        if !self.names.contains(n){
//                            self.names.append(n)
//                            print(n)
//                        }
//                    })
//            
//            //called after .childAdded is done
//                    ref.child("students").observeSingleEvent(of: .value, with: { snapshot in
//                            print("--inital load has completed and the last user was read--")
//                        print(self.names)
//                        self.tableView1.reloadData()
//                        })
            
            


        }

        
        // Do any additional setup after loading the view.
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
