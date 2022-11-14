//
//  InstagramDataModel.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import Foundation
import UIKit

struct Profile: Codable {
    var id: String
    var username: String
    var media: ProfileMedia
}

struct ProfileMedia: Codable {
    var data: [InstagramItem]
    var paging: Paging
}

struct InstagramItem: Codable {
    var id: String
    var mediaType: String?
    var mediaUrl: URL
    var timestamp: String
    var children: Media?
    var image: Data?
}

struct Media: Codable {
    var data: [MediaData]
}

struct MediaData: Codable {
    var id: String
}

struct Paging: Codable {
    var cursors: Cursors
    var previous: URL?
    var after: URL?
}

struct Cursors: Codable {
    var before: String
    var after: String
}

