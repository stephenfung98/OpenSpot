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

extension UserInformationViewController: UIAlertViewDelegate{
    @IBAction func nextClicked(_ sender: Any) {
        if !(fullNameTextField.text?.contains(" "))!{
            showErrorMessage(message: "Please Enter Your First And Last Name")
        }
        else if !(emailTextField.text?.contains("@"))! || !(emailTextField.text?.contains("."))!{
            showErrorMessage(message: "Please Enter A Valid Email")
        }
        else if Int(monthTextField.text!) ?? 13 > 13{
            showErrorMessage(message: "Please Enter Your Birth Month")
        }
        else if Int(dayTextField.text!) ?? 31 > 31{
            showErrorMessage(message: "Please Enter Your Birth Day")
        }
        else if !((yearTextField.text?.count ?? 0) > 3) || (Int(yearTextField.text!) ?? 1900 < 1900 || Int(yearTextField.text!) ?? 1991 >	 2019){
            showErrorMessage(message: "Please Enter Your Birth Year")
        }
        else{
            let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
            destinationVC.fullName = fullNameTextField.text!
            destinationVC.email = emailTextField.text!
            destinationVC.dateOfBirth =  monthTextField.text! + "/" + dayTextField.text! + "/" + yearTextField.text!
            self.navigationController!.pushViewController(destinationVC, animated: true)
        }
    }
    
    func showErrorMessage(message : String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
