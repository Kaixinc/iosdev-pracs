//
//  Item.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
