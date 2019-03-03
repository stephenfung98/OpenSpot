//
//  OpenSpotUITests.swift
//  OpenSpotUITests
//
//  Created by Stephen Fung on 2/15/19.
//  Copyright © 2019 Stephen Fung. All rights reserved.
//

import XCTest
import Firebase
@testable import OpenSpot

class OpenSpotUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
