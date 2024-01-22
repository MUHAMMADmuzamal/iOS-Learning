//
//  FormModel.swift
//  xibProject2
//
//  Created by codes orbit on 25/08/2023.
//

import Foundation

struct FormModel{
    let username:String?
    let email:String?
}


extension FormModel{
    static var data:[FormModel] = []
    static var selectedValueIndex:Int?
    
    static func addData(data:FormModel) {
        FormModel.data.append(data)
        print("hello",FormModel.data)
    }
    static func find(findData:FormModel) -> Bool {
        for value in self.data{
            if value.username ==  findData.username || value.email == findData.email{
                return true
            }
        }
        return false
    }
}

