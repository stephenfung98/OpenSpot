//
//  UserInformation.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/8/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit

class UserInformationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VehicleInformationViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
}

