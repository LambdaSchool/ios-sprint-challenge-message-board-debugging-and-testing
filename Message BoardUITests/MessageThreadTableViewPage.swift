//
//  MessageThreadTableViewPage.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessageThreadTableViewPage: TestPage {
    //MessageThreadsTableView
    
    // UI Elements
    var messageThreadTableViewController: XCUIElement {
        return app.tableRows["MessageThreadsTableView"]
    }
//MessageThreadsTableViewController.NewThreadTextField
//MessageThreadsTableViewController.TitleLabel
//MessageThreadsTableViewController.Cell
    
    // (Inter)Actions
    
    // Verifications
    var testCase: XCTestCase
}
