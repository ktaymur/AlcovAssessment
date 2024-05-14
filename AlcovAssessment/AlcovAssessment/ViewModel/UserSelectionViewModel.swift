//
//  UserSelectionViewModel.swift
//  AlcovAssessment
//
//  Created by Kate Murray on 5/14/24.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserSelectionViewModel: UIViewController, ObservableObject{
    
    //var ref: DatabaseReference!
    //var db: Firestore!
    
    //self.ref = Database.database().reference()
    let db = Firestore.firestore()
    
    func addUser(user: User){
        let user: [String: Any] = [ "selection" : user.selection]
        //User(selection: selection)
        
        db.collection("users").document("User1").setData(user){ error in
            if let error = error{
                print("Error adding document")
            } else {
                print("Document added successfully")
            }
        }
        
    }
    
    func updateUser(user: User) {
        //let documentId = user.uuid
        let updatedUser: [String: Any] = ["selection": user.selection]
        
        
        db.collection("users").document("User1").updateData(updatedUser){ error in
            if let error = error{
                print("Error updating document")
            }else {
                print("Document uploaded successfully")
            }}
    }
}
