//
//  ApiManager.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 21/05/2022.
//

import Foundation
import Alamofire

final class ApiManager {
    
    static let shared = ApiManager()
    
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void){
        
        AF.request(url).response { response in
            completion(response.result)
        }
        
    }
    
}
