//
//  MovieItemViewModel.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import Foundation
import Combine

class MovieItemViewModel: ObservableObject {
    @Published var movie: MovieModel

    init(movie: MovieModel) {
        self.movie = movie
    }
}
