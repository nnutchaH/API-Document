//
//  APIManager.swift
//  API Document
//
//  Created by Pony💛 yyy on 20/4/2563 BE.
//  Copyright © 2563 nnutcha. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidJSON
    case invalidData
}

class APIManager {
    
    func postLogin(completion: @escaping (Result<Login, APIError>) -> Void) {
        let urlString = "https://neversitup.pythonanywhere.com/login"
        let parameters = [
            "username": "test",
            "password": "123456"
        ]
        
        AF.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do{
                    let data = try JSONDecoder().decode(Login.self, from: response.data!)
                    completion(.success(data))
                }catch{
                    completion(.failure(APIError.invalidJSON))
                }
            case .failure:
                completion(.failure(APIError.invalidData))
            }
        }
    }
    
    func postDetail(token: String, customerId: String, completion: @escaping (Result<Detail, APIError>) -> Void) {
        let urlString = "https://neversitup.pythonanywhere.com/getCustomerDetail"
        let parameters = [
            "token": token,
            "customerId": customerId
        ]
        
        AF.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do{
                    let data = try JSONDecoder().decode(Detail.self, from: response.data!)
                    completion(.success(data))
                }catch{
                    completion(.failure(APIError.invalidJSON))
                }
            case .failure:
                completion(.failure(APIError.invalidData))
            }
        }
    }
    
}
