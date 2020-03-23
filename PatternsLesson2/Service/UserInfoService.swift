//
//  UserInfoService.swift
//  PatternsLesson2
//
//  Created by Ильдар Залялов on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

struct UserInfo {
    var name: String
    var age: String
}

protocol UserInfoSerivce {
    
    func obtainUserInfo() -> UserInfo
}

class UserInfoSerivceIml: UserInfoSerivce {
    
    var urlSession: URLSession!

    func obtainUserInfo() -> UserInfo {
        return UserInfo(name: "Ildar", age: "24")
    }
}
