//
//  DataProvider.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation


class DataProvider {
    typealias CallBackType = ((Error?, [Item]?)->())?

        
    func getDataFromCloud(callBackType: CallBackType) {
        
        let urlStr = "https://jsonplaceholder.typicode.com/todos/"
        let url = URL(string: urlStr)
        guard let urlUnwrapped = url else { return }
        URLSession.shared.dataTask(with: urlUnwrapped) { (data, response, error) in
            
            if error == nil {
                 let model = try! JSONDecoder.init().decode([Item].self, from: data!)
                callBackType?(nil, model)
                //post from here
            } else {
                callBackType?(error, nil)
                //post from here
            }
        }.resume()
    }
}
