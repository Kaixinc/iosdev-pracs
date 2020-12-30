//
//  MVVMClosureTests.swift
//  MVVMClosureTests
//
//  Created by Kaixin Chen on 12/17/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import XCTest
import Foundation
@testable import MVVMClosure

class MVVMClosureTests: XCTestCase {

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
        
        let vm = ToDoViewModel.init()
        XCTAssertNotNil(vm, "item view model shoild not be nil")
    }
    
    func testGetItemAtIndex() {
           
        let vm = ToDoViewModel.init()
        let res = vm.getItem(index: 0)
        XCTAssertNil(res, "since we have not data source array hence u will gey nothing/empty/nil")
       }
    

    func testGetDataFromDataProvider() {
        let vm = ToDoViewModel.init()
        
        let urlStr = "https://jsonplaceholder.typicode.com/todos/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
                
        vm.getDataFromApiHandler(url: urlUnwrapped) {
            APIHandler.shared.getDataFromCloud(url: url!, type: [Todo].self) { (anyOptional, errorOptional) in
                vm.dataSourceArray = anyOptional as? [Todo]
                vm.error = errorOptional
            }
        }
        
        let seconds = 20
        sleep(UInt32(seconds))
        XCTAssertGreaterThan(vm.getCount(), 0)
    }
    
    func testGetError() {
        let vm = ToDoViewModel.init()
           
        let urlStr = "http://jsonplaceholder.typicode.com/todo/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
           
        vm.getDataFromApiHandler(url: urlUnwrapped) {
            APIHandler.shared.getDataFromCloud(url: url!, type: [Todo].self) { (anyOptional, errorOptional) in
                vm.dataSourceArray = anyOptional as? [Todo]
                vm.error = errorOptional
            }
        }
           
        let seconds = 20
        sleep(UInt32(seconds))
        
        let e = vm.getError() ?? "No Error"
        let count = e.count
        XCTAssertGreaterThan(count, 0, "for non http we will definetly get error")
       }
    
    

}
