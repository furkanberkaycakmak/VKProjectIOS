//
//  PostReviewsResponseModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import Foundation

struct PostReviewsResponseResult: Codable {
    let productId : String?
    let locale : String?
    let rating : Int?
    let text : String?
    
    
    enum CodingKeys: String, CodingKey {
        case productId
        case locale
        case rating
        case text
    }
}
