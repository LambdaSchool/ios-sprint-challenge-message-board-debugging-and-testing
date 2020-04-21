//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Jessie Ann Griffin on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
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
