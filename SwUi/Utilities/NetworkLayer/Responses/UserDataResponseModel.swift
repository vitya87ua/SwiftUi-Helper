//
//  UserDataResponseModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

// MARK: - DataUser
struct UserData: Codable {
    let user: UserModel
    let jwt: String
}

// MARK: - User
struct UserModel: Codable {
    let id: Int
    let email: String
    let fullName: String
}
