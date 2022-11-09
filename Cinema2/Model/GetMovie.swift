//
//  GetMovie.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 24.01.2022.
//

import Foundation
struct Tags: Codable, Hashable{
    let   idTags : String
    let  tagName : String

}
struct GetMovie: Codable, Hashable{
    let movieId: String
    let name: String
    let description: String
    let age: String
    let images: [String]
    let poster: String
    let tags: [Tags]
  }
