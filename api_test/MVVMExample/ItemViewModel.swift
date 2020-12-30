//
//  ItemViewModel.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation


protocol ItemViewModelProtocol {
    func didFinishGettingDataFromProvider()
}

class ItemViewModel: DataProviderProtocol {
    
    var itemViewModelProtocol: ItemViewModelProtocol?
    var dataProvider: DataProvider?
    private var dataSourceArray: [Item]?
    private var error: Error?
    
    func didFinishCloudResponse(error: Error?, data: [Item]?) {
        self.error = error
        self.dataSourceArray = data
        itemViewModelProtocol?.didFinishGettingDataFromProvider() //edit right place to send call back obviously after getting response from cloud

    }
    
    func getDataFromDataProvider(url: URL, provider: DataProvider) {
        self.dataProvider = provider
        self.dataProvider?.getDataFromCloud(url: url)
    }
    
    func numberOfItems()->Int{
        return dataSourceArray?.count ?? 0
    }
    
    func getItemAtIndex(index: Int) -> Item? {
        return dataSourceArray?[index]
    }
    
    func getTitleForItem(item: Item?) -> String {
        
        guard let uitem = item else { return "no item found" }
        return uitem.title
    }
    
    
    
    func getError()->String? {
        return error?.localizedDescription
    }
}
