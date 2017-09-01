//
//  User.swift
//  RxSwiftLearning
//
//  Created by tran.xuan.diep on 9/1/17.
//  Copyright © 2017 tran.xuan.diep. All rights reserved.
//

import Foundation
import Mapper

struct User: Mapper {
    let id:Int?
    let name:String?
    let avatarUrl:String?
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try name = map.from("name")
        try avatarUrl = map.from("avatar_url")
    }

}
