//
//  UserInformation.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/8/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit
import Firebase

class UserInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Sign up"
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
        destinationVC.fullName = fullNameTextField.text!
        destinationVC.email = emailTextField.text!
        destinationVC.dateOfBirth =  monthTextField.text! + "/" + dayTextField.text! + "/" + yearTextField.text!
        
        self.navigationController!.pushViewController(destinationVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // Try to find next responder
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let char = string.cString(using: String.Encoding.utf8)
        let isBackSpace = strcmp(char, "\\b")
        if isBackSpace == -92 {
            return true
        }
        if textField == monthTextField || textField == dayTextField{
            if textField.text!.count == 1{
                if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                    textField.text = textField.text! + string
                    nextField.becomeFirstResponder()
                }
            }
            return textField.text!.count < 2
        }
        else if textField == yearTextField{
            return textField.text!.count < 4
        }
        return true
    }
    
}



