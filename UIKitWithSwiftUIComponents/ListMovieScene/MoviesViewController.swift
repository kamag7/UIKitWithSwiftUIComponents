//
//  MoviesViewController.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 05/09/2023.
//

import UIKit
import SwiftUI

class MoviesViewController: UIViewController {

    var movieViewModel: MoviesViewModel = MoviesViewModel()
    var movies: [MovieModel] = []
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()

        Task {
            await initializeValues()
        }
    }

    func initializeValues() async {
        await movieViewModel.fetchMovies()
        movies = movieViewModel.movies
        collectionView?.reloadData()
    }

    private func setupCollectionView() {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(112))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.interGroupSpacing = 10
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        collectionView?.backgroundColor = UIColor.black
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView!)

        NSLayoutConstraint.activate([
            collectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }

    func setupView() {
        view.backgroundColor = .black
        self.title = "Movies"
    }
}

extension MoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        collectionViewCell.contentConfiguration = UIHostingConfiguration {
            let view = MovieItemView(viewModel: MovieItemViewModel(movie: self.movies[indexPath.row]))
            return view
        }
        return collectionViewCell
    }
}

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let detailMovieModel = DetailMovieModel(id: movie.id,
                                                title: movie.title,
                                                description: movie.description,
                                                posterPath: movie.posterPath,
                                                releaseDate: .init(wrappedValue: movie.releaseDate, dateFormat: "YYYY-MM-dd"))
        let vc = DetailMovieViewController(movie: detailMovieModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}
