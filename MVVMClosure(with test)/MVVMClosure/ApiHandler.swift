//
//  ApiHandler.swift
//  MVVMClosure
//
//  Created by Alok Upadhyay on 17/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation

typealias CompletionHandler = ((Any?, Error?) -> Void)?

class APIHandler {
    
    static let shared = APIHandler.init()
    
    private init(){}
    
    func getDataFromCloud<T: Codable>(url: URL, type: T.Type, completionHandler: CompletionHandler) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if (error == nil) && (data != nil) {
                let model = try? JSONDecoder().decode(type.self, from: data!)
                completionHandler?(model, error)
            } else {
                completionHandler?(nil, error)
            }
            
        }.resume()
    }
}
