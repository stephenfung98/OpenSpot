//
//  MenuOptions.swift
//  PackageTrackerV1
//
//  Created by Stephen Fung on 2/20/19.
//  Copyright © 2019 Stephen Fung. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Driveway
    case Payment
    case Vehicle
    case Support
    case signOut
    
    var description: String {
        switch self {
        case .Driveway: return "List your driveway"
        case .Payment: return "Payment"
        case .Vehicle: return "Vehicle"
        case .Support: return "Contact us"
        case .signOut: return "Log out"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Driveway: return UIImage(named: "Driveway") ?? UIImage()
        case .Payment: return UIImage(named: "Payment") ?? UIImage()
        case .Vehicle: return UIImage(named: "Vehicle") ?? UIImage()
        case .Support: return UIImage(named: "Support") ?? UIImage()
        case .signOut: return UIImage(named: "SignOut") ?? UIImage()
        }
    }
}
