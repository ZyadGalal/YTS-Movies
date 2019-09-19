//
//  MoviesListModel.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

// MARK: - MoviesList
struct MoviesList: Codable {
    let status: Stat
    let statusMessage: String
    let data: DataClass
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let movieCount, limit, pageNumber: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movies
    }
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int
    let url: String
    let title, titleEnglish, titleLong: String
    let year: Int
    let rating: Double
    let runtime: Int
    let genres: [String]?
    let summary, descriptionFull: String
    let backgroundImage, backgroundImageOriginal, smallCoverImage, mediumCoverImage: String
    let largeCoverImage: String
    let state: Stat
    let dateUploaded: String
    let dateUploadedUnix: Int
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case title
        case titleEnglish = "title_english"
        case titleLong = "title_long"
        case year, rating, runtime, genres, summary
        case descriptionFull = "description_full"
        case backgroundImage = "background_image"
        case backgroundImageOriginal = "background_image_original"
        case smallCoverImage = "small_cover_image"
        case mediumCoverImage = "medium_cover_image"
        case largeCoverImage = "large_cover_image"
        case state
        case dateUploaded = "date_uploaded"
        case dateUploadedUnix = "date_uploaded_unix"
    }
}

enum Stat: String, Codable {
    case ok = "ok"
}

