//
//  AuthenticationManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

protocol AuthenticationNetwork {
    func signIn(credential: Credential, completion: @escaping (Result<Response<UserData>, Error>) -> Void)
}

class AuthenticationNetworkManager: RequestManager, AuthenticationNetwork {
    
    func signIn(credential: Credential, completion: @escaping (Result<Response<UserData>, Error>) -> Void) {
        request(PostSignInRequest(credential: credential), completion: completion)
    }
}
