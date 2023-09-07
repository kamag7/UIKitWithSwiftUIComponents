//
//  DetailMovieViewController.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import UIKit
import SwiftUI

class DetailMovieViewController: UIViewController {
    let movie: DetailMovieModel

    init(movie: DetailMovieModel) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let detailMovieView = DetailMovieView(viewModel: DetailMovieViewModel(movie: self.movie))
        let hostingController = UIHostingController(rootView: detailMovieView)
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear
        view.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}
