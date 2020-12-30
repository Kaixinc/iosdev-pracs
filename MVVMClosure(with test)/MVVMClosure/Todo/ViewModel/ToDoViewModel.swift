//
//  ToDoViewModel.swift
//  MVVMClosure
//
//  Created by Alok Upadhyay on 17/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation

typealias ToDoViewModelCompletionHandler = (() -> Void)?


class ToDoViewModel {
    
    var dataSourceArray: [Todo]?
    var error: Error?
    
    func getDataFromApiHandler(url: URL, toDoViewModelCompletionHandler: ToDoViewModelCompletionHandler) {
        
        APIHandler.shared.getDataFromCloud(url: url, type: [Todo].self) { (anyOptional, errorOptional) in
            self.dataSourceArray = anyOptional as? [Todo]
            self.error = errorOptional
            toDoViewModelCompletionHandler?()
        }
    }
    
    func getCount() -> Int {
        return dataSourceArray?.count ?? 0
    }
    
    func getItem(index: Int) -> Todo? {
        return dataSourceArray?[index]
    }
    
    func getError() -> String? {
        return error?.localizedDescription
    }
    
    func getAllInFoString (todo: Todo) -> String {
        return "\(todo.id) + \(todo.title) + \(todo.userId) + \(todo.completed)"
    }
}
