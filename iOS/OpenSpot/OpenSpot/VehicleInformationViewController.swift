//
//  VehicleInformationViewController.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/9/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit

class VehicleInformationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func backClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UserInformationViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func skipClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func finishClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
