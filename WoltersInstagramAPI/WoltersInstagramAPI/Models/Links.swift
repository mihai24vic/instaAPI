//
//  InstagramLinks.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import Foundation

struct InstagramLinks {

    /// ADD TOKEN HERE
    ///
    ///
    static let accesToken = ""

    static let baseUrl = "https://graph.instagram.com/"
    static let meUrl = "me?fields=id,username,media&access_token="
    static let childrenUrl = NSLocalizedString("https://graph.instagram.com/%@?fields=id,media_type,media_url,timestamp&access_token=\(accesToken)",
                                               comment: "String for individual items with id")
    static let absoluteUrl = "https://graph.instagram.com/me?fields=media%7Bid,media_type,media_url,timestamp,children%7D,id,username&access_token=\(accesToken)"

    static let mediaIdUrl =  NSLocalizedString("https://graph.instagram.com/me?fields=id,username,media&access_token=\(accesToken)",
                                               comment: "String for frofile - please add token")

}
