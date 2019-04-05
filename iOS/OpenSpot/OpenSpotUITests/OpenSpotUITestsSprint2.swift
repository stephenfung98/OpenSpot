//
//  OpenSpotUITestsSprint2.swift
//  OpenSpotUITests
//
//  Created by Stephen Fung on 4/5/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import XCTest
import Firebase
@testable import OpenSpot

class OpenSpotUITestsSprint2: XCTestCase {
    
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
    
    //    Stephen
    func testInputGeneralData_38() {
        let app = XCUIApplication()
        if app.scrollViews.otherElements.buttons["Sign in with phone"].exists{
            app.scrollViews.otherElements.buttons["Sign in with phone"].tap()
            let key = app.keyboards.keys["1"]
            while !key.exists {
            }
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            app.navigationBars["Enter phone number"].buttons["Verify"].tap()
            while !key.exists {
            }
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            key.tap()
            app.navigationBars["Verify phone number"].buttons["Next"].tap()
        }
        
    }
    //    Jay
    func testInputVehicle_39() {
    }
    //    Jay & Stephen
    func testSendToFirebase_40() {
    }
    //    Stephen
    func testEditPersonalData_42() {
    }
    //    Stephen
    func testContactUs_43() {
    }
    //    Jay
    func testEditVehicles_44() {
    }
    
}
