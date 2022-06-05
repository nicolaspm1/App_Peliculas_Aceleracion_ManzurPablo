//
//  MovieListViewController.swift
//  AlkeMovies
//
//  Created by Pablo Manzur on 21/05/2022.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieListTableView: UITableView!
    
    private var movieListService = MovieListService()
    private var movieListViewModel: MovieListViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.movieListViewModel = MovieListViewModel(service: movieListService)
        self.movieListViewModel?.delegate = self
        self.movieListViewModel?.getMovies()
    }
    
    
    
    private func setUpView(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        setNavigationBar(withTitle: "Movies")
        
        self.movieListTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewCell")
        self.movieListTableView.delegate = self
        self.movieListTableView.dataSource = self
    }
        
    
}

//MARK: - UITableViewDelegate

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print(self.movieListViewModel?.getMovieAt(indexPath.row).backdropPath! ?? "")
        
        let movie = self.movieListViewModel?.getMovieAt(indexPath.row)
        let movieIdEntero = movie?.id
        let extraerID = movieIdEntero.self!
        let movieId = "\(String(describing: extraerID))"
        let movieDetailVC = MovieDetailViewController()
        
        let apiKey = "?api_key=\(Constants().kApiKey)"
        
        let movieUrl = "\(Constants().kMovieDetailURL)\(movieId)\(apiKey)"
        movieDetailVC.movieUrl = movieUrl
        
        
        if let movieU = movie?.backdropPath {
            print(Constants().kImageURL + movieU)
        }
         
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
        
        
        
        
    }
}

//MARK: - UITableViewDataSource

extension MovieListViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieListViewModel?.getMoviesCount() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        cell.movieName.adjustsFontSizeToFitWidth = true
        cell.movieName.text = self.movieListViewModel?.getMovieAt(indexPath.row).title
        
        didSelect(cell)
        
        return cell
    }
    
    
    private func didSelect(_ cell: MovieTableViewCell){
        let view = UIView()
        view.backgroundColor = .systemPink
        cell.selectedBackgroundView = view
    }
    
}


//MARK: - MovieListDelegate

extension MovieListViewController : MovieListDelegate {
    func toggleLoading() {
        print("Loading")
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
    
    
}
