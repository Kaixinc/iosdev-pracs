//
//  DataProvider.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation

class DataProvider {
    
    static let shared = DataProvider.init()
    
    private init() {
        
    }
    
    func getDataFromCloud(_ urlS: String, completion: @escaping (Datas?, URLResponse?, Error?) -> Void) {
        let url = URL(string: urlS)
        guard let unwrapUrl = url else {return}
        
        URLSession.shared.dataTask(with: unwrapUrl) { (data, response, error) in
            guard error == nil else {
                return completion(nil,nil,error)
            }
            
            do{
                guard let unwrapData = data else {return}
                let model = try? JSONDecoder().decode(Datas.self, from: unwrapData)
                completion(model,response,nil)
            }
            
        }.resume()
    }
}
