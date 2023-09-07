//
//  MovieItemView.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 06/09/2023.
//

import SwiftUI

struct MovieItemView: View {
    @StateObject var viewModel: MovieItemViewModel
    var body: some View {
        HStack {
            AsyncImage(url: ImageRequestUrl.imageURL(imageStringUrl: viewModel.movie.posterPath),
                       scale: 7) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 80, maxHeight: 80)
            }
        placeholder: {
            Image(systemName: "film")
                .foregroundColor(.white)
        }
        .clipped()

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.movie.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(0)

                Text(viewModel.movie.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 16)
            .padding(.trailing, 16)
        }
        .background(.gray.opacity(0.2))
        .listRowBackground(Color.black)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.white, lineWidth: 1)
        )
        .cornerRadius(14)

    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(viewModel: MovieItemViewModel(
            movie: MovieModel(id: 1,
                              title: "title",
                              description: "description",
                              posterPath: nil,
                              releaseDate: nil)))
    }
}
