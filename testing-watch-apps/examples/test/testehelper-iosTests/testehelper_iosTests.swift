//
//  testehelper_iosTests.swift
//  testehelper-iosTests
//
//  Created by Boris Bügling on 08/07/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import XCTest
@testable import testehelper_ios

class testehelper_iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let model = Person(salutation: "", firstName: "Neo", lastName: "Nacho", birthdate: Date(timeIntervalSince1970: 783734843))
        let viewModel = PersonViewModel(model: model)

        XCTAssertEqual(viewModel.birthdateText, "Wednesday November 2, 1994")
    }
    
}
