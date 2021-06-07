//
//  ColorViewModelTests.swift
//  ColorsTests
//
//  Created by Nkanyiso Hlela on 2021/06/06.
//

import XCTest
@testable import Colors

class ColorViewModelTests: XCTestCase {
    
    func testsGetHexSuccess(){
        let colorServiceApi = ColorApiServiceMock()
        var gotHexColor = false
        let expectation = self.expectation(description: "Success")
        colorServiceApi.convertRGBColorToHex(rgbColor: "255,255,255") { result in
            defer {
                XCTAssertTrue(gotHexColor)
                expectation.fulfill()
            }
            switch result{
            case .success(let data):
                XCTAssertEqual(data.hex?.value,"#FFFF")
                gotHexColor = true
            case .failure(_):
                gotHexColor = false
            }
        }
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    func testsGetHexFailure(){
        let colorServiceApi = ColorApiServiceMock()
        var failedToGetHexColor = false
        let expectation = self.expectation(description: "Failure")
        colorServiceApi.convertRGBColorToHex(rgbColor: "0,0,0") { result in
            defer {
                XCTAssertTrue(failedToGetHexColor)
                expectation.fulfill()
            }
            switch result{
            case .success(_):
                failedToGetHexColor = false
            case .failure(let error):
                XCTAssertEqual(error as! RequestError, RequestError.failedNoData)
                failedToGetHexColor = true
            }
        }
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
