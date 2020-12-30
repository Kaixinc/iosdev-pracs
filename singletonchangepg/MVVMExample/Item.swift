//
//  Item.swift
//  MVVMExample
//
//  Created by Alok Upadhyay on 07/12/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import Foundation

struct Datas: Decodable{
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [stuff]?
}

struct Item: Decodable {
    let login: String
    let id: Int
    let node_id : String
    let gravatar_id: String
    let url: String
    let html_url: String
    let followers_url: String
    let following_url: String
    let gists_url: String
    let starred_url: String
    let subscriptions_url: String
    let organizations_url: String
    let repos_url: String
    let events_url:String
    let received_events_url:String
    let type: String
    let site_admin: Bool
    let score: Float
}

struct stuff: Decodable{
    let node_id : String
}
