//
//  ImageRequestUrl.swift
//  UIKitWithSwiftUIComponents
//
//  Created by magdalena.skawinska on 05/09/2023.
//

import Foundation

final class ImageRequestUrl {
    static func imageURL(imageStringUrl: URL?) -> URL? {
        guard let imageUrl = imageStringUrl else {
            return nil
        }

        return URL(string: Environment.imageBaseUrl.trimmingCharacters(in: .punctuationCharacters) + imageUrl.absoluteString)
    }
}
