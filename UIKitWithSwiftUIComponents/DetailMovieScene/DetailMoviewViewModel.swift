//
//  DetailMoviewViewModel.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import Foundation

class DetailMovieViewModel: ObservableObject {
    @Published var movie: DetailMovieModel

    init(movie: DetailMovieModel) {
        self.movie = movie
    }
}
