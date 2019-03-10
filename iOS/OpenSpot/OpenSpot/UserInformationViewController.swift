//
//  UserInformation.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/8/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit
import Firebase

class UserInformationViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Sign up"
        
        dateOfBirthTextField.textAlignment = .center
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        let db = Firestore.firestore()
        
        let currentUser = Auth.auth().currentUser
        
//        db.collection("Users").document((currentUser?.uid)!).getDocument{ (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        
        db.collection("Users").document((currentUser?.uid)!).setData([
            "phoneNumber": currentUser?.phoneNumber!,
            "fullName": fullNameTextField.text!,
            "email": emailTextField.text!,
            "dateOfBirth": dateOfBirthTextField.text!
            ])
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController")
//        self.present(controller, animated: true, completion: nil)
    }
    

    
    
    
}



