//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Moses Robinson on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
