//
//  ItemViewModel.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation


class ItemViewModel{
    
    func getDataFromViewModel(urlString: String, completion: @escaping (Datas?)-> Void) {
        DataProvider.shared.getDataFromCloud(urlString, completion: { (data, response, error) in
            completion(data)
        })
        
    }
}
