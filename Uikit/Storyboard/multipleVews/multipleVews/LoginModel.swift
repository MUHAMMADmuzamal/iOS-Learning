//
//  LoginModel.swift
//  multipleVews
//
//  Created by codes orbit on 23/08/2023.
//

import Foundation

struct LoginModel: Hashable{
    var id:String = UUID().uuidString
    var username: String
    var email: String
}
