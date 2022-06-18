//
//  MovieDetailViewController.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 29/05/2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
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
//        setUpView()
        
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
        
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func loadDataOf(movie: MovieDetail) {
        
        DispatchQueue.main.async {
            self.movieTitle.text = movie.title
            self.movieOverview.text = movie.overview
            self.movieGenre.text = "\(String(describing: movie.genres[0].name!))"
            self.moviePopularity.text = String(describing: movie.popularity)
            self.movieReleaseDate.text = movie.releaseDate
            self.movieOriginalLanguage.text = movie.originalLanguage
            
            if let url = movie.backdropPath, let fullUrl = URL(string: Constants().kImageURL + url){
                self.movieImage.load(url: fullUrl)
            }
            
            self.setNavigationBar(withTitle: movie.title)
            
        }
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        
    }
    
    func showError() {
        print("Ocurrio un error")
    }
    
    
}
