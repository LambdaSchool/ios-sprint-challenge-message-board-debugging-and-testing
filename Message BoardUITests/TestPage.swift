//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Andrew Dhan on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
