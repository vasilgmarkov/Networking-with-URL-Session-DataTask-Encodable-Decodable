//
//  Post.swift
//  Networking-URLDataTask
//
//  Created by vas mar on 07/04/2021.
//

import Foundation

struct Post: Decodable, Encodable {
    let id: Int
    let title, body: String
}
