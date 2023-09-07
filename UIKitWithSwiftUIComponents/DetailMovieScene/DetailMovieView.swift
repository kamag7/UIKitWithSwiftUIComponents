//
//  DetailMovieView.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import SwiftUI

struct DetailMovieView: View {
    @StateObject var viewModel: DetailMovieViewModel

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                AsyncImage(url: ImageRequestUrl.imageURL(imageStringUrl: viewModel.movie.posterPath),
                           scale: 7) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400, maxHeight: 900)
                }
            placeholder: {
                Image(systemName: "film")
                    .foregroundColor(.white)
            }
                Text(viewModel.movie.title)
                Text(viewModel.movie.$releaseDate ?? "")
                Text(viewModel.movie.description ?? "")
            }
            .foregroundColor(.white)
        }
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(viewModel: DetailMovieViewModel(
            movie: DetailMovieModel(id: 1,
                                    title: "title",
                                    description: "description",
                                    posterPath: nil,
                                    releaseDate: .init(wrappedValue: Date(), dateFormat: "YYYY-MM-dd"))))
    }
}
