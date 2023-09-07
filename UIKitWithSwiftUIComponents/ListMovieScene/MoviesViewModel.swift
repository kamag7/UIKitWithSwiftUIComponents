//
//  MoviesViewModel.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import Foundation
import SwiftUI

@MainActor
class MoviesViewModel: ObservableObject {
    @Published var movies: [MovieModel] = []

    func fetchMovies() async {
        let movies = await Service.shared.nowPlaying()
        self.movies = movies.map {
            MovieModel(id: $0.id,
                       title: $0.title,
                       description: $0.overview,
                       posterPath: $0.posterPath,
                       releaseDate: $0.releaseDate)
        }
    }
}
