//
//  UserManager.swift
//  PatternsLesson2
//
//  Created by Ильдар Залялов on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

@objc class User: NSObject {
    
   @objc dynamic var info: String
    
    init(info: String) {
        self.info = info
    }
}


class UserManager {
    
   fileprivate var userDefaults: UserDefaults!
   fileprivate var userInfoService: UserInfoSerivce!
    
   private static let sharedUser = User(info: "First info")
    
    typealias Class = UserManager
    
    class func configuredManager() -> UserManager {
        
        let manager = UserManager()
        manager.userDefaults = UserDefaults.standard
        manager.userInfoService = ServicesFacadeRelease().configureUserInfoService()
        
        return manager
    }
    
    func obtainMainUser() -> User {

        let user = Class.sharedUser
        
        return user
    }
    
    func changeUserInfo(_ info: String) {
        
        Class.sharedUser.info = info
    }
}

class UserInfoHandler {
    
    
}
