//
//  Person.swift
//  MVP-LevelOne
//
//  Created by Зайнал Гереев on 21.08.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id : Int
    var name : String
    var email: String
    var body: String
}

