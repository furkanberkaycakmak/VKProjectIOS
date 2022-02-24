//
//  UpdateProductResponseModel.swift
//  VKProject
//
//  Created by Berkay ÇAKMAK on 14.02.2022.
//

import Foundation

struct UpdateProductResponseResult: Codable {
    let id : String?
    let name : String?
    let description : String?
    let imgUrl : String?

    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imgUrl
    }
}
