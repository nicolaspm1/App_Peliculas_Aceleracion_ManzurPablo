//
//  MovieListViewModel.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 25/05/2022.
//

import Foundation

protocol MovieListDelegate {
    func toggleLoading()
    func reloadTable()
    func showError()
}


class MovieListViewModel {
    
    private var movieListService: MovieListService
    private var movies = [Movie]()
    var delegate: MovieListDelegate?
    
    
    init(service: MovieListService) {
        self.movieListService = service
    }
    
    func getMovies() {
        movieListService.getMovies { movies in
            self.movies = movies
            self.delegate?.reloadTable()
        } onError: {
            self.delegate?.showError()
        }

    }
    
    
    func getMovieAt(_ index: Int) -> Movie {
        movies[index]
    }
    
    
    func getMoviesCount() -> Int {
        movies.count
    }
}
