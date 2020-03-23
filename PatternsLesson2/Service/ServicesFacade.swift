//
//  ServicesFacade.swift
//  PatternsLesson2
//
//  Created by Ильдар Залялов on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation

protocol ServicesFacade {
    
    func configureAuthService() -> AuthService
    
    func configureUserInfoService() -> UserInfoSerivce
}


class ServicesFacadeRelease {
    
    func configureAuthService() -> AuthService {
        return AuthServiceImpl()
    }
    
    func configureUserInfoService() -> UserInfoSerivce {
        
        let serivce = UserInfoSerivceIml()
        serivce.urlSession = URLSession.shared
               
        return serivce
    }
}

class ServicesFacadeDebug: ServicesFacadeRelease {
    
//    override func configureAuthService() -> AuthService {
//
//    }
//
//    override func configureUserInfoService() -> UserInfoSerivce {
//
//    }
}
