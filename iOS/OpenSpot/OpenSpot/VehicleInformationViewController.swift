//
//  VehicleInformationViewController.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/9/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit
import Firebase

class VehicleInformationViewController: UIViewController {
    
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var license: UITextField!
    var fullName = String?("")
    var email = String?("")
    var dateOfBirth = String?("")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        make.underlined()
        model.underlined()
        license.underlined()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    
    @IBAction func skipClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UITabBarController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func finishClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UITabBarController")
        self.present(controller, animated: true, completion: nil)
        
        db.collection("Users").document((currentUser?.uid)!).setData([
            "phoneNumber": currentUser?.phoneNumber!,
            "fullName": fullName,
            "email": email,
            "dateOfBirth": dateOfBirth,
            "make": make.text!,
            "model": model.text!,
            "license": license.text!
            ])
    }
    

    
}

extension UITextField {
        func underlined(){
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height + 0.6 - width , width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
}
