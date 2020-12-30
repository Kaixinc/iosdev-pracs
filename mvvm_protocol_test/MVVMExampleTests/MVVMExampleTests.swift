//
//  MVVMExampleTests.swift
//  MVVMExampleTests
//
//  Created by Alok Upadhyay on 15/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation
import XCTest
@testable import MVVMExample



class MVVMExampleTests: XCTestCase {
    
    override class func setUp() {
    }
    
    override class func tearDown() {
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewModelInitiation() {
        
        let vm = ItemViewModel.init()
        XCTAssertNotNil(vm, "item view model shoild not be nil")
    }
    
    func testGetItemAtIndex() {
           
           let vm = ItemViewModel.init()
        let res = vm.getItemAtIndex(index: 0)
        XCTAssertNil(res, "since we have not data source array hence u will gey nothing/empty/nil")
       }
    
    func testNumberOfItems() {
        let vm = ItemViewModel.init()
        let res = vm.numberOfItems()
        XCTAssertEqual(res, 0, "since we have not data source array hence u will get 0 items")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
