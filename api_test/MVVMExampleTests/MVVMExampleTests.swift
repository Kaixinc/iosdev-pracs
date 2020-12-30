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
    
    func testGetDataFromDataProvider() {
        let vm = ItemViewModel.init()
        
        let urlStr = "https://jsonplaceholder.typicode.com/todos/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
        
        let dataProvider = DataProvider()
        dataProvider.dataProviderProtocol = vm
        
        vm.getDataFromDataProvider(url: urlUnwrapped, provider: dataProvider)
        
        let seconds = 20
        sleep(UInt32(seconds))
        XCTAssertGreaterThan(vm.numberOfItems(), 0)
        
    }
    
    
    func testGetDataFromDataProviderWrogUrl() {
        let vm = ItemViewModel.init()
        
        let urlStr = "https://jsonplaceholder.typicode.com/todo/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
        
        let dataProvider = DataProvider()
        dataProvider.dataProviderProtocol = vm
        
        vm.getDataFromDataProvider(url: urlUnwrapped, provider: dataProvider)
        
        let seconds = 20
        sleep(UInt32(seconds))
        XCTAssertEqual(0, vm.numberOfItems(), "with wrong url we should have zeo items")
        
    }
    
    func testGetError() {
           let vm = ItemViewModel.init()
           
           let urlStr = "http://jsonplaceholder.typicode.com/todo/"
           let url = URL(string: urlStr)
           guard let urlUnwrapped = url else { return }
           
           let dataProvider = DataProvider()
           dataProvider.dataProviderProtocol = vm
           
           vm.getDataFromDataProvider(url: urlUnwrapped, provider: dataProvider)
           
           let seconds = 20
           sleep(UInt32(seconds))
        
        let e = vm.getError() ?? ""
        let count = e.count
        XCTAssertGreaterThan(0, count, "for non http we will definetly get error")
       }
    
    func testGetErrorInNoNetwork() {
        let vm = ItemViewModel.init()
        
        let urlStr = "http://jsonplaceholder.typicode.com/todo/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
        
        let dataProvider = DataProvider()
        dataProvider.dataProviderProtocol = vm
        
        vm.getDataFromDataProvider(url: urlUnwrapped, provider: dataProvider)
        
        let seconds = 20
        sleep(UInt32(seconds))
     
     let e = vm.getError() ?? ""
     let count = e.count
     XCTAssertGreaterThan(0, count, "for non http we will definetly get error")
        //equals = The resource could not be loaded because the App Transport Security policy requires the use of a secure connection.
    }
    
    
    

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
