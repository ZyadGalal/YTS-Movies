//
//  Constants.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

struct Constants {
    static let baseURL = "https://yts-am-torrent.p.rapidapi.com/"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case apiRapidKey = "X-RapidAPI-Key"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
    case apiRapidKey = "324ca5747dmsha5c600be9060e86p15312fjsnfd3116fb3ff1"
}
