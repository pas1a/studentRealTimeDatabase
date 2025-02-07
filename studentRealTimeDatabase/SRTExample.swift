//
//  SRTExample.swift
//  studentRealTimeDatabase
//
//  Created by JOHN GARIEPY on 2/4/25.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

class Students{
    var name: String
    var age: Int
    var ref = Database.database().reference()
    


    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    init(dict: [String:Any]) {
        // Safely unwrapping values from dictionary
                if let a = dict["age"] as? Int{
                    age = a
                }
                else{
                    age = 0
                }
        // Safely Unwrapping values from dict ()
        if let b = dict["name"] as? String{
            name = b
        } else {
            name = "unknown"
        }
    }
    
    func saveToFireBase(){
        let dict = ["name": name, "age":age] as [String: Any]
        ref.child("students2").childByAutoId().setValue(dict)
        
        

    }
}
