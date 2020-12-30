//
//  Todo.swift
//  MVVMClosure
//
//  Created by Alok Upadhyay on 17/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation
struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
