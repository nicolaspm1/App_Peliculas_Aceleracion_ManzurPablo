//
//  MovieDetailViewModel.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 29/05/2022.
//

import Foundation


protocol MovieDetailDelegate {
    func toggleLoading()
    func loadDataOf(movie: MovieDetail)
    func showError()
}


class MovieDetailViewModel {
    
    private var delegate: MovieDetailDelegate
    private var movieDetailService: MovieDetailService
    private var movieUrl: String
    
    
    init(service: MovieDetailService, movieUrl: String, delegate: MovieDetailDelegate) {
        self.movieDetailService = service
        self.movieUrl = movieUrl
        self.delegate = delegate
    }
    
    
    func getMovie() {
        self.delegate.toggleLoading()
        movieDetailService.getDetailWith(movieUrl: self.movieUrl, onComplete: { movie in
            self.delegate.loadDataOf(movie: movie)
            
        }, onError: {
            self.delegate.showError()
        })
        
    }
}
