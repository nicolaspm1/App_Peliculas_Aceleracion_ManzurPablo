//
//  MovieListService.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 25/05/2022.
//

import Foundation


class MovieListService {
    
    func getMovies(onComplete: @escaping ([Movie]) -> Void, onError: @escaping () -> Void) {
        
        let const = Constants()
        
        ApiManager.shared.get(url: "\(const.kMovieListURL)\(const.kApiKey)") { response in
            switch response {
                case .success(let data):
                    do {
                        
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                            onComplete(moviesResponse.results)
                        } else{
                            onError()
                        }
                        
                    } catch  {
                        onError()
                    }
                case .failure(_):
                    onError()
            }
        }
    }
}
