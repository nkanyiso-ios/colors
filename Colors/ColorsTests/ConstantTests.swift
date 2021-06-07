//
//  ConstantTests.swift
//  ColorsTests
//
//  Created by Nkanyiso Hlela on 2021/06/06.
//

import Foundation
import XCTest
@testable import Colors

class ConstantTests: XCTestCase {
    
    func testValidConstant(){
        XCTAssertEqual(Links.path, "https://www.thecolorapi.com/id?rgb=")
    }
}
