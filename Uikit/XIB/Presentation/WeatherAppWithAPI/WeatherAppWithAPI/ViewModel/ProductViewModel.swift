//
//  ProductViewModel.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 05/09/2023.
//

import Foundation
import Alamofire

protocol ProductViewModelDelegate{
    func success(data: Products)
    func failure(error: Error)
}

class ProductViewModel{
    
    let url = "https://dummyjson.com/products"
    var delegate:ProductViewModelDelegate?
    
    func fetchProduts(limit: Int,skip: Int)  {
        let parameters: [String: Int] = [
            "limit": limit,
            "skip": skip
        ]
         AF.request(url,
                   parameters: parameters)
        .responseDecodable(of: Products.self){ respose in
            debugPrint(respose)
            switch respose.result{
            case .success(let data):
                self.delegate?.success(data: data)
            case .failure(let error):
                self.delegate?.failure(error: error)
            }
        }
    }
}
