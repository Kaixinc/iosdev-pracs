//
//  ItemViewModel.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation


class ItemViewModel {
    
    private let dataProvider = DataProvider()
    private var dataSourceArray: [Item]?
    private var error: Error?
    typealias CallBackType = (()->())?

    func getDataFromDataProvider(callBackType: CallBackType) {

        dataProvider.getDataFromCloud { (error, data) in
            self.error = error
            self.dataSourceArray = data
            callBackType?()
        }
    }
    
    func numberOfItems()->Int{
        return dataSourceArray!.count
    }
    
    func getItemAtIndex(index: Int) -> Item {
        return dataSourceArray![index]
    }
    
    func getError()->String? {
        return error?.localizedDescription
    }
}
