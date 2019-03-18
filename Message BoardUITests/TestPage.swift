//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Ivan Caldwell on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase {get}
}

extension TestPage {
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
