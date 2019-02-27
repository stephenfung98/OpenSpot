//
//  ThirdViewController.swift
//  OpenSpot
//
//  Created by Stephen Fung on 2/15/19.
//  Copyright © 2019 Stephen Fung. All rights reserved.
//

import UIKit
import FirebaseUI

class ThirdViewController: UIViewController, FUIAuthDelegate {
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuTableView.register(MenuOptionCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: MenuOptionCell
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuOptionCell
            let menuOption = MenuOption(rawValue: indexPath.row)
            cell.descriptionLabel.text = menuOption?.description
            cell.iconImageView.image = menuOption?.image
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.row{
            case 0:
                print("0")
            case 1:
                print("1")
            case 2:
                print("2")
            case 3:
                print("3")
            case 4:
                try! Auth.auth().signOut()
                
                if self.storyboard != nil {
                    let authUI = FUIAuth.defaultAuthUI()
                    authUI?.isSignInWithEmailHidden = true
                    FUIAuth.defaultAuthUI()?.shouldHideCancelButton = true
                    authUI?.delegate = self
                    let providers: [FUIAuthProvider] = [FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),]
                    
                    authUI?.providers = providers
                    let authViewController = authUI!.authViewController()
                    self.present(authViewController, animated: false, completion: nil)
                }
            default:
                print("else")
            }
        }
    
}


