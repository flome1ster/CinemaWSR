//
//  Episodes.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 29.01.2022.
//

import Foundation
struct Episodes: Codable, Hashable{
    let episodeId: String
    let name: String
    let description: String
    let director: String
    let stars: [String]
    let year: String
    let images: [String]
    let runtime: String
    let preview: String
    let moviesId: String
}
