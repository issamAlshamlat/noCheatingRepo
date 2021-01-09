//
//  LalaMoveUITests.swift
//  LalaMoveUITests
//
//  Created by Issam Alshamlat on 1/5/21.
//

import XCTest
import LalaMove

class LalaMoveUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        let app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["To : Montauk Court"]/*[[".cells.staticTexts[\"To : Montauk Court\"]",".staticTexts[\"To : Montauk Court\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let backButton = app.navigationBars["Delivery Details"].buttons["Back"]
        backButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["To : Clinton Street"]/*[[".cells.staticTexts[\"To : Clinton Street\"]",".staticTexts[\"To : Clinton Street\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Add To Favourite"]/*[[".buttons[\"Add To Favourite\"].staticTexts[\"Add To Favourite\"]",".staticTexts[\"Add To Favourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Remove from favourite"]/*[[".buttons[\"Remove from favourite\"].staticTexts[\"Remove from favourite\"]",".staticTexts[\"Remove from favourite\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Add To Favourite"].tap()
        backButton.tap()
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
