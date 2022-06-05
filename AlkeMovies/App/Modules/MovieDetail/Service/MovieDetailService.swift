//
//  MovieDetailService.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 29/05/2022.
//

import Foundation


class MovieDetailService {
    
    func getDetailWith(movieUrl: String, onComplete: @escaping (MovieDetail) -> Void,  onError: @escaping () -> Void) {
        
        
        ApiManager.shared.get(url: movieUrl) { response in
            switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let movieResponse = try decoder.decode(MovieDetail.self, from: data)
                            
                            onComplete(movieResponse)
                        } else {
                            onError()
                        }
                        
                    } catch{
                        onError()
                        print(error)
                    }
                case .failure(_):
                    onError()
            }
        }
    }
    
}
