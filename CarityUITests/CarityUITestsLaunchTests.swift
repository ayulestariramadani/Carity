//
//  CarityUITestsLaunchTests.swift
//  CarityUITests
//
//  Created by Ayu Lestari Ramadani on 24/05/23.
//

import XCTest

final class CarityUITestsLaunchTests: XCTestCase {
    let app = XCUIApplication()
    
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunch() throws {
        app.launch()
        

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testDashboardAppearance() throws {
        let dashboardNavBarTitle = app.staticTexts.element
        XCTAssertTrue(dashboardNavBarTitle.exists)
    }

    func testAddPatientButton() throws {
        let addPatient = app.buttons["addPatient"]
        XCTAssert(addPatient.exists)
        XCTAssertEqual(addPatient.label, "Add Patient")
    }

    func testSwitchPatientButton() throws {
        let switchPatient = app.buttons["switchPatient"]
        XCTAssert(switchPatient.exists)
        XCTAssertEqual(switchPatient.label, "Switch")
    }

    func testAddPatientFormAppearance() throws {
        app.buttons["addPatient"].tap()
        let addPatientTextField = app.textFields["nameTextField"]
        XCTAssert(addPatientTextField.exists)
        
    }
    
    func testClickPatientCard() throws {
        
    }
    
    func testAddNote() throws {
        
    }
}
