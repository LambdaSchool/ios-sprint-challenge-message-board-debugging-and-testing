//
//  MessageThreadControllerTestPage.swift
//  Message BoardUITests
//
//  Created by Dillon McElhinney on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadTVCTestPage: TestPage {
    var testCase: XCTestCase
    
    // MARK: - UI Elements
    private var newThreadTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.NewThreadTextField"]
    }
    
    private func cell(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    // MARK: - Actions
    @discardableResult func createNewThread(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadTVCTestPage {
        testCase.expect(exists: newThreadTextField, file: file, line: line)
        newThreadTextField.tap()
        newThreadTextField.typeText(title)
        newThreadTextField.typeText("\n")
        return self
    }
    
    @discardableResult func tapCell(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadDetailTVCTestPage {
        let cell = self.cell(title)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return MessageThreadDetailTVCTestPage(testCase: testCase, parent: self, title: title)
    }
    
    // MARK: - Verifications
    
    @discardableResult func cellExists(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadTVCTestPage {
        let cell = self.cell(title)
        testCase.expect(exists: cell, file: file, line: line)
        return self
    }
    
    @discardableResult func titleDisplays(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadTVCTestPage {
        let navBar = app.navigationBars.firstMatch
        testCase.expect(navBar.identifier, equals: title, file: file, line: line)
        return self
    }
}
