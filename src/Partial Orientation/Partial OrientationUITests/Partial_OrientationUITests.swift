//
//  Partial_OrientationUITests.swift
//  Partial OrientationUITests
//
//  Created by Muhammad Ahsan Iqbal on 07/03/2017.
//  Copyright © 2017 Creative Chaos (Pvt.) Ltd. All rights reserved.
//

import XCTest

class Partial_OrientationUITests: XCTestCase {

    var app: XCUIApplication!

    let navigateButtonVC = "NavigateButtonVC"
    let navigateButtonAOVC = "NavigateButtonAOVC"

    let titleAOVC = "2nd View Controller (All Orientation)"
    let titleOPVC = "3rd View Controller (Portrait)"

    let backButtonIdentifier = "Back"

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()

        XCUIDevice.shared().orientation = .portrait

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func landscapeToPortraitTestCase() {

        app.buttons[navigateButtonVC].tap()
        XCUIDevice.shared().orientation = .landscapeRight
        app.buttons[navigateButtonAOVC].tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(UIDeviceOrientationIsPortrait(XCUIDevice.shared().orientation), "First test case is passed")

    }

    func landscapeToLandscapeTestCase() {

        XCUIDevice.shared().orientation = .landscapeRight

        pressBackButton(navigationBar: titleAOVC)
//        app.navigationBars["2nd View Controller (All Orientation)"].buttons["Back"].tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(UIDeviceOrientationIsPortrait(XCUIDevice.shared().orientation), "Second test case is passed")

    }

    // Press Back Button
    func pressBackButton(navigationBar navBar: String) {

        let backButton = app.navigationBars[navBar].children(matching: .button).matching(identifier: backButtonIdentifier).element(boundBy: 0)
        backButton.tap()

    }

    func testExample() {

        // Use recording to get started writing UI tests.

        // Landscape to Portrait orientation
        landscapeToPortraitTestCase()

        // Navigate back to previous view
        pressBackButton(navigationBar: titleOPVC)

        // Landscape to Landscape orientation
        landscapeToLandscapeTestCase()

    }

}
