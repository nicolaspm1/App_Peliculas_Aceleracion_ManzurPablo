//
//  MovieDetailViewController.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 29/05/2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOriginalLanguage: UILabel!
    
    
    
    private let service = MovieDetailService()
    private var viewModel: MovieDetailViewModel?
    var movieUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        if let url = movieUrl {
            self.viewModel = MovieDetailViewModel(service: self.service, movieUrl: url, delegate: self)
            self.viewModel?.getMovie()
        }

        
    }

    private func setUpView() {
        setNavigationBar(withTitle: "Movie Detail")
    }

    

}


extension MovieDetailViewController: MovieDetailDelegate{
    func toggleLoading() {
        print("Cargando info..")
    }
    
    func loadDataOf(movie: MovieDetail) {
        movieTitle.text = movie.title
        movieOverview.text = movie.overview
        movieGenre.text = "\(String(describing: movie.genres[0].name!)) - \(String(describing: movie.genres[1].name ?? ""))"
        moviePopularity.text = String(describing: movie.popularity)
        movieReleaseDate.text = movie.releaseDate
        movieOriginalLanguage.text = movie.originalLanguage
        
        if let url = movie.backdropPath, let fullUrl = URL(string: Constants().kImageURL + url){
            self.movieImage.load(url: fullUrl)
        }
        
    }
    
    func showError() {
        print("Ocurrio un error")
    }
    
    
}
