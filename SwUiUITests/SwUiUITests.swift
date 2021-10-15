//
//  SwUiUITests.swift
//  SwUiUITests
//
//  Created by Viktor Berezhnytskyi on 09.10.2021.
//

import XCTest

class SwUiUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }


    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let toggleOn = app.switches["toggleMoveOn"]
        let textOn = app.staticTexts["textChangeOn"]

        toggleOn.tap()

        XCTAssertEqual("ON", textOn.label)

    }
}
