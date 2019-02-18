//
//  FirstViewController.swift
//  OpenSpot
//
//  Created by Stephen Fung on 2/15/19.
//  Copyright © 2019 Stephen Fung. All rights reserved.
//

import UIKit
import FirebaseUI

class FirstViewController: UIViewController, FUIAuthDelegate {
    @IBAction func SignOut(_ sender: Any) {
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

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if Auth.auth().currentUser != nil {
            //do something :D
        } else {
            let authUI = FUIAuth.defaultAuthUI()
            authUI?.isSignInWithEmailHidden = true
            FUIAuth.defaultAuthUI()?.shouldHideCancelButton = true
            authUI?.delegate = self
            let providers: [FUIAuthProvider] = [FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!)]
            
            authUI?.providers = providers
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: false, completion: nil)
        }
    }
    
    
}
