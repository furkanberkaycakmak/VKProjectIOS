//
//  PostReviewsRequestModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import Foundation


class PostReviewsModel: Codable {
    let id : String
    let productId : String
    let locale : String
    let rating : Int
    let text : String
}
